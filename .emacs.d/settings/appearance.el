;; Full-screen and split window if not terminal
(if (display-graphic-p)
    (full-screen-mode))
(if (display-graphic-p)
    (split-window-right))

;; Mode-line
(setq display-time-format "%H:%M - %A, %d %B %Y - Vecka %W")
(display-time-mode 1) 

;; Custom appearance variables
(custom-set-variables
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t))

;; Makes *scratch* empty.
(setq initial-scratch-message "") 

;; Removes *scratch* from buffer after the mode has been set.
;; (defun remove-scratch-buffer ()
;;   (if (get-buffer "*scratch*")
;;       (kill-buffer "*scratch*")))
;; (add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
;(setq-default message-log-max nil)
;(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
;;(add-hook 'window-setup-hook 'delete-other-windows)

;; Open buffer-menu and dired 
;;(ibuffer)

;; Turn off flickering for bell
(setq visible-bell nil)
