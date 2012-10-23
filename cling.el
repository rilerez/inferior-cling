(require 'comint)

(defun cling (&optional flags)
  (interactive)
  (let ((flags (or flags "-std=c++11")))
    (make-comint "inferior-cling" "cling" nil flags)
    (switch-to-buffer "*inferior-cling*")))

(defun cling-send-string (string &optional process)
  (let ((process (or process (get-process "inferior-cling"))))
    (comint-send-string process string)
    (comint-send-string process "\n")))

(defun cling-send-region (start end)
  (interactive "r")
  (cling-send-string (buffer-substring start end)))

(defun cling-send-buffer ()
  (interactive)
  (cling-send-region (point-min) (point-max)))

(defun cling-wrap-raw (string)
  (format ".rawInput\n%s\n.rawInput" string))

(defun cling-wrap-region-and-send (start end)
  (interactive "r")
  (cling-send-string (cling-wrap-raw (buffer-substring start end))))

(defun flatten-function-def ()
  (interactive)
  (replace-regexp "
" "" nil (mark) (point))) 

(defun select-defun ()
  (interactive)
  (move-beginning-of-line nil)
  (push-mark (point))
  (re-search-forward "{")
  (save-excursion
   (flatten-function-def))
  (backward-char)
  (forward-sexp))

(defun cling-wrap-defun-and-send ()
  (interactive)
  (save-excursion
    (select-defun)
    (cling-wrap-region-and-send (mark) (point))
    (undo)
    (undo)));;;this is a rather leaky way of doing temporary changes. there should be some way to save buffer contents or some shit
;;;probably uses with-temp-buffer
(defvar cling-key-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-c\C-r" 'cling-send-region)
    map))


