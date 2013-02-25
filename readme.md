Inferior Cling
==============

Purpose
-------

To provide an Emacs minor mode for interractive development of C/C++ using ROOT's Cling C++ interpreter.

Status
------

As of now, this project only contains elisp functions that send code from a C++ file to the cling interpreter. This facilitates

Notes
-----
* The term `defun` is borrowed from Common Lisp and Emacs Lisp, and refers to a function definition

* Cling can only accept function definitions in raw-input mode, which is triggered by `.rawInput`. This requires an extra set of elisp functions to send Cling C++ function definitions. This is the purpose of `cling-wrap-raw`, `cling-wrap-region-and-send`, and `cling-wrap-defun-and-send`.
