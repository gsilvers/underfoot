# Underfoot
> Link to Documentation: <a href='https://gsilvers.github.io/Underfoot/'>Docs</a>


This file will become your README and also the index of your documentation.

## Install

`pip install undefoot`

## How to use

* That is TO BE DETERMINED :)

Right now there are just some notes here on setting up this or any NBDev Project

* NBDev's Github template currently has some issues on first run. When you first run:

```bash
nbdev_build_lib
Traceback (most recent call last):
  File "/Users/gregsilverstein/opt/anaconda3/bin/nbdev_build_lib", line 10, in <module>
    sys.exit(nbdev_build_lib())
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/site-packages/fastscript/core.py", line 76, in _f
    func(**args.__dict__)
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/site-packages/nbdev/cli.py", line 140, in nbdev_build_lib
    write_tmpls()
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/site-packages/nbdev/export2html.py", line 497, in write_tmpls
    write_tmpl(topnav_tmpl, 'host git_url', cfg, cfg.doc_path/'_data'/'topnav.yml')
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/site-packages/nbdev/export2html.py", line 490, in write_tmpl
    dest.write_text(outp)
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/pathlib.py", line 1251, in write_text
    with self.open(mode='w', encoding=encoding, errors=errors) as f:
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/pathlib.py", line 1218, in open
    return io.open(self, mode, buffering, encoding, errors, newline,
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/pathlib.py", line 1074, in _opener
    return self._accessor.open(self, flags, mode)
FileNotFoundError: [Errno 2] No such file or directory: '/Users/gregsilverstein/Source/Underfoot/Underfoot/docs/_data/topnav.yml'
```

* You can resolve this error by creating thist topnav.yml and empty directory as such from your root of your Project

```bash
;cd docs/
;mkdir _data
;cd _data/
;touch topnav.yml
```

* There also appears to be an issue building docs:

```bash
;nbdev_build_docs
converting: /Users/gregsilverstein/Source/Underfoot/Underfoot/index.ipynb
converting: /Users/gregsilverstein/Source/Underfoot/Underfoot/00_core.ipynb
'HTMLExporter' object has no attribute 'template_path'
'HTMLExporter' object has no attribute 'template_path'
Traceback (most recent call last):
  File "/Users/gregsilverstein/opt/anaconda3/bin/nbdev_build_docs", line 10, in <module>
    sys.exit(nbdev_build_docs())
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/site-packages/fastscript/core.py", line 76, in _f
    func(**args.__dict__)
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/site-packages/nbdev/cli.py", line 221, in nbdev_build_docs
    notebook2html(fname=fname, force_all=force_all, n_workers=n_workers, pause=pause)
  File "/Users/gregsilverstein/opt/anaconda3/lib/python3.8/site-packages/nbdev/export2html.py", line 582, in notebook2html
    raise Exception(msg + '\n'.join([f.name for p,f in zip(passed,files) if not p]))
Exception: Conversion failed on the following:
00_core.ipynb
index.ipynb
```

* Checking now to see if this is some sort of issue with me following the tutorial or if it is this issue [Issue Link](https://forums.fast.ai/t/htmlexporter-object-has-no-attribute-template-path/80775/8)
* this is actually more complicated. Anaconda right now is installing a bad dependency where ti is taking NBconvert v6.x while NBDev requires 5.2
* Simply uninstalling NBDEV from anaconda and re-installing it under pip works but this is pretty bad.
