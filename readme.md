Inferior Cling
==============

Purpose
-------

To provide an Emacs minor mode for interactive C/C++ development using ROOT's Cling C++ interpreter.

Status
------

As of now, this project only contains elisp functions that send code from a C++ file to the cling interpreter. This facilitates

Keybindings
-----------
| Key sequence | function                    | action                                    |
| -------------|-----------------------------|-------------------------------------------|
| C-c r        | 'cling-send-region          | sends the current region to inferior-cling|
| C-c d        | 'cling-wrap-defun-and-send  | sends the current function definition to cling in raw input mode|

Notes
-----
* The term `defun` is borrowed from Common Lisp and Emacs Lisp, and refers to a function definition

* Cling can only accept function definitions in raw-input mode, which is toggled by `.rawInput`. This requires an extra set of elisp functions to send Cling C++ function definitions. This is the purpose of `cling-wrap-raw`, `cling-wrap-region-and-send`, and `cling-wrap-defun-and-send`.

Todo
-----
- [ ] add sane keybindings
- [ ] work around Cling's inability to redefine functions 
- [ ] work around Cling's tendency to crash

Installation
============
Prerequisites
---------------
Cling (http://root.cern.ch/drupal/content/cling) must be downloaded and on the path for `cling.el` to work. Binary downloads can be found here (https://ecsft.cern.ch/dist/cling/current/). ROOT also provides instructiosn for building from source, and binary or source packages can be found in some distributions' package managers. 

Loading for one session
-------------------------
To load the file for one session, execute the command
```elisp
(load "PATH/TO/cling.el")
```

Adding to .emacs
-----------------
To always load `cling.el`, 
*save cling.el to a directory in emacs's `load-path`. This can be done by saving cling.el to the `site-lisp` directory or by adding `(add-to-list 'load-path "PATH/TO/cling.el") to your .emacs
* require cling 
```elisp
(require 'cling)
```
