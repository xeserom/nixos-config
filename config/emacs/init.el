;; https://www.masteringemacs.org/article/mastering-key-bindings-emacs

(require 'exwm)
(require 'exwm-config)
(exwm-config-example)

(desktop-save-mode 1)
(load-theme 'solarized-selenized-dark t)

;; Disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq column-number-mode t) ;; Enables column number

(set-default 'truncate-lines t) ;; Disables line wrapping
;; (set-default 'global-hl-line-mode t) ;; Enables line highlight, needs hook for files only

;; Maybe shouldn't be global
;; (global-set-key (kbd "C-c C-l") 'global-hl-line-mode)

;; (add-hook 'find-file-hook 'linum-mode)
;; (add-hook 'text-mode-hook 'linum-mode)

;; (setq linum-format "%4d ")
;; (setq-default left-fringe-width  0)
;; (setq-default right-fringe-width 0)
;; (set-face-attribute 'fringe nil :background "black")

(defun foo()
  "Test"
  (hl-line-mode)
  (linum-mode))

(add-hook 'prog-mode-hook 'foo)

;;(add-hook 'emacs-lisp-mode-hook
;;	  (lambda ()
;;	    (local-set-key (kbd "C-c c") 'eval-buffer)))

(global-set-key (kbd "s-<left>") 'previous-buffer)
(global-set-key (kbd "s-<right>") 'next-buffer)
(global-set-key (kbd "s-<return>") 'multi-vterm)

(server-force-delete)
(server-start)
