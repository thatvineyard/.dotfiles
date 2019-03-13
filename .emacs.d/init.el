(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("MELPA" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (multiple-cursors yaml-mode php-mode haskell-mode yasnippet shrink-whitespace multi-web-mode flycheck dired+ auto-complete))))

;; Directories
(setq settings-dir
      (expand-file-name "settings" default-directory))
(setq lisp-dir
      (expand-file-name "lisp" default-directory))
(setq elpa-dir
      (expand-file-name "elpa" default-directory))

;; Packages

(setq package-user-dir elpa-dir)
(package-initialize)

(add-to-list 'load-path elpa-dir) 
(add-to-list 'load-path lisp-dir) 

; Guess style
(add-to-list 'load-path (expand-file-name "lisp/guess-style" user-emacs-directory))
(autoload 'guess-style-set-variable "guess-style" nil t)
(autoload 'guess-style-guess-variable "guess-style")
(autoload 'guess-style-guess-all "guess-style" nil t)

; Single functions
(load-library "eval-and-replace")
(load-library "full-screen-mode")
(load-library "new-compile")
(load-library "line-manip")
(load-library "comment")

;; (use-package ido
;;              :config
;;              (ido-mode t)
;;              (setq ido-enable-flex-matching t)
;; 	     (setq ido-file-extensions-order '(".c", ".erl")))

;; Settings
(add-to-list 'load-path settings-dir) 
(load-library "appearance")
(load-library "sane-defaults")
(load-library "keybindings")
(load-library "editing")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
