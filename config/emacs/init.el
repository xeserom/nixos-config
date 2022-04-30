;; https://www.masteringemacs.org/article/mastering-key-bindings-emacs
(load-theme 'solarized-selenized-dark t)

;; Disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq visible-bell t)

;; Naked Emacs
;; (toggle-frame-fullscreen)
(tool-bar-mode 0)
(toggle-scroll-bar 0) 
(menu-bar-mode 0)

(setq column-number-mode t) ;; Enables column number
(set-default 'truncate-lines t) ;; Disables line wrapping

;; (setq linum-format "%4d ")
;; (setq-default left-fringe-width  0)
;; (setq-default right-fringe-width 0)
;; (set-face-attribute 'fringe nil :background "black")

(add-hook 'prog-mode-hook
	  (lambda ()
	    (hl-line-mode)
	    (linum-mode)))

(global-set-key (kbd "C-,") 'previous-buffer)
(global-set-key (kbd "C-.") 'next-buffer)
(global-set-key (kbd "C-<return>")
		(lambda ()
		  (interactive)
		  (split-window-right)
		  (other-window 1 )
		  (multi-vterm)))
	       

;; (global-set-key (kbd "C-j") 'left-char)
;; (global-set-key (kbd "C-k") 'previous-line)
;; (global-set-key (kbd "C-l") 'next-line)
;; (global-set-key (kbd "C-;") 'right-char)

(server-force-delete)
(server-start)
