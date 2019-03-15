;; auto-complete mode
;(add-hook 'c-mode-hook 'auto-complete-mode)

;; yasnippets global mode
;(yas-global-mode 1)

;; Flycheck
(add-hook 'c-mode-hook (setq flycheck-clang-lanugage-standard "gnu11"))

;; HideShow mode
;(add-hook 'c-mode-hook 'hs-minor-mode)
;(add-hook 'c++-mode-hook 'hs-minor-mode)
;(add-hook 'bibtex-mode-hook 'hs-minor-mode)
;(add-hook 'java-mode-hook 'hs-minor-mode)
;(add-hook 'js-mode-hook 'hs-minor-mode)
;(add-hook 'erlang-mode-hook 'hs-minor-mode)
;(add-hook 'yaml-mode-hook 'hs-minor-mode)

(require 'multiple-cursors)

;; (defvar hs-special-modes-alist
;;   (mapcar 'purecopy
;;   '((-mode "\\S*\\s\\S*[\\(]\\S*[\\){]" "}" "/[*/]" nil nil)
;;     (c++-mode "{" "}" "/[*/]" nil nil)
;;     (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
;;     (java-mode "{" "}" "/[*/]" nil nil)
;;     (js-mode "{" "}" "/[*/]" nil)
;;     (erlang-mode "->" "." nil nil))))
