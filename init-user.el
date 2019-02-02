;;; init-user.el --- Customizations on base emacs.d
;;
;;; Commentary:
;;; Code:


;; Theme: monokai.el
(use-package monokai-theme
  :ensure t
  :pin melpa-stable
  :init)


;; Enable smex -- for M-x autocomplete
(use-package smex
  :ensure t
  :pin melpa-stable
  :init)
(global-set-key (kbd "M-x") 'smex)


;; ido mode -- autocomplete C-x b / C-x C-f
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; Enable recentf
(use-package recentf
  :ensure t
  :pin melpa-stable
  :init)
(recentf-mode t)
;; replace 'find-file-read-only'
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 15)
(setq recentf-auto-cleanup 'never)
(defun ido-recentf-open ()
  "Use 'ido-completing-read' to \\[find-file] a recent file."
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;; Golang / gotest
(use-package go-mode
  :ensure t
  :pin melpa-stable
  :init)
(use-package gotest
  :ensure t
  :pin melpa-stable
  :init)
(define-key go-mode-map (kbd "C-x t") 'go-test-current-test)
(define-key go-mode-map (kbd "C-x f") 'go-test-current-file)


;; Projectile
(projectile-mode t)
(global-set-key (kbd "s-t") 'projectile-find-file)
(global-set-key (kbd "s-r") 'projectile-replace)
(global-set-key (kbd "s-g") 'projectile-grep)
(global-set-key (kbd "s-p") 'projectile-switch-project)
(global-set-key (kbd "s-a") 'projectile-toggle-between-implementation-and-test)


;; Show full file path in the title bar
(setq
 frame-title-format
 '((:eval (if (buffer-file-name)
        (abbreviate-file-name (buffer-file-name))
      "%b"))))


;; Disables audio bell
(setq ring-bell-function
      (lambda () (message "*beep*")))


;; Highlight current line
(global-hl-line-mode)


;; Scroll one line at a time
(setq scroll-conservatively 10)


;; Remove bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; Remove selected text via backspace / enter
(delete-selection-mode t)


;; Use y/n instead of full yes/no
(fset 'yes-or-no-p 'y-or-n-p)


;; Line numbers
(global-linum-mode t)


;; Remove trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Git status
(global-set-key (kbd "C-c g") 'magit-status)


;; Move backups elsewhere
(setq backup-directory-alist `(("." . "~/.saves")))

;; Enable org mode
(use-package org
  :ensure t
  :pin melpa-stable
  :init)


;; Enable undo-tree
(use-package undo-tree
  :ensure t
  :init)
(global-undo-tree-mode t)
(global-set-key (kbd "s-Z") 'undo-tree-redo)


;; Enable flycheck
(use-package flycheck
  :ensure t
  :pin melpa-stable
  :init)
(global-flycheck-mode t)


(provide 'init-user)
;;; init-user.el ends here
