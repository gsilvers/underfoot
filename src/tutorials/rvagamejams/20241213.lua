function returns_eight()
   return 4 + 4
end

also_returns_eight = function()
   return 4+4
end

add_four = function(a)
   return a + 4
end



result = also_returns_eight()
print(result)

print(add_four(12))

noise = function(animal)
  if (animal == "dog") then return "woof" end
  return ""
end

print(noise("dog"))
print(noise("rabbit"))

for number = 1, 10 do
  print(number)
end

local self_reference
self_reference = function()
  print(self_reference)
end

self_reference()
