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