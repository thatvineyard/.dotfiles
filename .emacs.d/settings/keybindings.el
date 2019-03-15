;; iBuffer
(global-set-key "\C-x\C-b" 'ibuffer)

;; Shrink whitespace
;(global-set-key "\M-D" 'shrink-whitespace)

;; Tab to other windows
(global-set-key (kbd "<C-tab>") 'other-window)
;; Split window horizontally
(global-set-key (kbd "\C-T") 'split-window-right)
;; Kill current split
(global-unset-key "\C-W")
(global-set-key "\C-W" 'delete-window)

;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

;; Windows Style Undo, Copy, Paste
(global-set-key [(control z)] 'undo)

;; (global-set-key [(control c)] 'kill-ring-save) 
(global-set-key "\C-v" 'yank)
(global-set-key "\M-v" 'yank-pop)

;; Make ctrl+undo
(global-unset-key (kbd "\C-z"))
(global-set-key (kbd "\C-z") 'undo)

;; Multicursors
(global-set-key (kbd "<C-M-down>") 'mc/mark-next-like-this)
(global-set-key (kbd "<C-M-up>") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "'M-c C-<") 'mc/mark-all-like-this)

;; Line manipulation
(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "<M-up>") 'move-line-up)
(global-set-key (kbd "C-d") 'duplicate-line) 

;; Comments				
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line) 


;; Org-mode
;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-cc" 'org-capture)
;;(global-set-key "\C-ca" 'org-agenda)
;;(global-set-key "\C-cb" 'org-iswitchb)
