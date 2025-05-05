(local fennel (require :lib.fennel))
(local repl (require :lib.stdio))
(local canvas (let [(w h) (love.window.getMode)]
                (love.graphics.newCanvas w h)))

(var scale 1)

;; set the first mode
(var (mode mode-name) nil)

(fn set-mode [new-mode-name ...]
  (set (mode mode-name) (values (require new-mode-name) new-mode-name))
  (when mode.activate
    (match (pcall mode.activate ...)
      (false msg) (print mode-name "activate error" msg))))

(fn love.load [args]
  (set-mode :mode-intro)
  (canvas:setFilter "nearest" "nearest")
  (when (~= :web (. args 1)) (repl.start)))

(fn safely [f]
  (xpcall f #(set-mode :error-mode mode-name $ (fennel.traceback))))

(fn love.draw []
  ;; the canvas allows you to get sharp pixel-art style scaling; if you
  ;; don't want that, just skip that and call mode.draw directly.
  (love.resize 1920 1080)
  (love.graphics.setCanvas canvas)
  (love.graphics.clear)
  (love.graphics.setColor 1 1 1)
  (safely mode.draw)
  (love.graphics.setCanvas)
  (love.graphics.setColor 1 1 1)
  (love.graphics.draw canvas 0 0 0 scale scale)
  (love.graphics.setColor 1 1 1)
  (love.graphics.print "Welcome to Underfoot" 200 10)
  (local image (love.graphics.newImage "resources/molly_actual.png"))
  (love.graphics.draw image 10 0) 
  )

(fn love.resize [x y])

(fn love.update [dt]
  (when mode.update
    (safely #(mode.update dt set-mode))))

(fn love.keyreleased [key code isrepeat]
  (if (and (love.keyboard.isDown "lctrl" "rctrl" "capslock") (= key "q"))
      (love.event.quit)
      ;; add what each keypress should do in each mode
      (not isrepeat)
      (safely #(mode.keypressed key set-mode))))
