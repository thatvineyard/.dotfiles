;; 1). Use compile-again to run the same compile as the last time
;; automatically, no prompt. If there is no last time, or there is a
;; prefix argument, it acts like M-x compile.

;; 2). compile will split the current window(always be a certain
;; size), it will not affect the other windows in this frame.

;; 3). it will auto-close the *compilation* buffer (window) if there
;; is no error, keep it if error exists.

;; 4). it will highlight the error line and line number of the source
;; code in the *compilation* buffer, use M-n/p to navigate every error
;; in *compilation* buffer, Enter in the error line to jump to the
;; line in your code code.

(require 'compile)
(setq compilation-last-buffer nil)
(defun compile-again (ARG)
  "Run the same compile as the last time.

If there is no last time, or there is a prefix argument, this acts like M-x compile."
  (interactive "p")
  (if (and (eq ARG 1)
           compilation-last-buffer)
      (progn
        (set-buffer compilation-last-buffer)
        (revert-buffer t t))
    (progn
      (call-interactively 'compile)
      (setq cur (selected-window))
      (setq w (get-buffer-window "*compilation*"))
      (select-window w)
      (setq h (window-height w))
      (shrink-window (- h 10))
      (select-window cur))))
(global-set-key (kbd "C-x C-m") 'compile-again)
(defun my-compilation-hook ()
  "Make sure that the compile window is splitting vertically."
  (progn
    (if (not (get-buffer-window "*compilation*"))
        (progn
          (split-window-vertically)))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)
(defun compilation-exit-autoclose (STATUS code msg)
  "Close the compilation window if there was no error at all."
  ;; If M-x compile exists with a 0
  (when (and (eq STATUS 'exit) (zerop code))
    ;; then bury the *compilation* buffer, so that C-x b doesn't go there
    (bury-buffer)
    ;; and delete the *compilation* window
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;; Always return the anticipated result of compilation-exit-message-function
  (cons msg code))
(setq compilation-exit-message-function 'compilation-exit-autoclose)
(defvar all-overlays ())
(defun delete-this-overlay(overlay is-after begin end &optional len)
  (delete-overlay overlay)
  )
(defun highlight-current-line ()
"Highlight current line."
  (interactive)
  (setq current-point (point))
  (beginning-of-line)
  (setq beg (point))
  (forward-line 1)
  (setq end (point))
  ;; Create and place the overlay
  (setq error-line-overlay (make-overlay 1 1))

  ;; Append to list of all overlays
  (setq all-overlays (cons error-line-overlay all-overlays))

  (overlay-put error-line-overlay
               'face '(background-color . "red"))
  (overlay-put error-line-overlay
               'modification-hooks (list 'delete-this-overlay))
  (move-overlay error-line-overlay beg end)
  (goto-char current-point))
(defun delete-all-overlays ()
  "Delete all overlays"
  (while all-overlays
    (delete-overlay (car all-overlays))
    (setq all-overlays (cdr all-overlays))))
(defun highlight-error-lines(compilation-buffer process-result)
  (interactive)
  (delete-all-overlays)
  (condition-case nil
      (while t
        (next-error)
        (highlight-current-line))
    (error nil)))
(setq compilation-finish-functions 'highlight-error-lines)
