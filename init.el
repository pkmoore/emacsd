(require 'generic-x)
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;========== helper functions ==========

;; Check if system is Darwin/Mac OS X
(defun system-type-is-darwin ()
(interactive)
"Return true if system is darwin-based (Mac OS X)"
(string-equal system-type "darwin"))

;; Check if system is GNU/Linux
(defun system-type-is-gnu ()
(interactive)
"Return true if system is GNU/Linux-based"
(string-equal system-type "gnu/linux"))

;; ========== configuration ==========

;; enable and configure evil mode
(require 'evil)
    (evil-mode 1)

;; enable and configure helm
(require 'helm-config)
(helm-mode 1)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)

;; enable line numbers all the time
;;(global-nlinum-mode t)
;;(setq-default nlinum-format "%d ")
(linum-relative-global-mode)
(helm-linum-relative-mode)

;; enable and configure projectile-related stuff
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("82b67c7e21c3b12be7b569af7c84ec0fb2d62105629a173e2479e1053cff94bd" "4ab86c7682db09485a6e046ee0a6c45b5462f514c89844f4ed8b329aa1708067" "37def0fac11a4890922af9febc8394e3b6e3c68904a294a2d440b1904e979c7e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "Orange" :foreground "black"))))
 '(minibuffer-prompt ((t (:foreground "Orange")))))

;; set appropriate theme (must occurr after the custom safe themes stuff)
(load-theme 'idea-darkula)

;; disable the startup message buffer
(setq inhibit-startup-message t)

;; disable the ugly toolbar when starting in window mode
(tool-bar-mode -1)

;; disable the messages buffer by setting its size to nil and killing
;; the existing buffer on startup
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; configure C style

(defun my-c-hook ()
  (fci-mode)
  (setq fill-column 80)
  (helm-cscope-mode))

(setq-default c-default-style "stroustrup"
	      c-basic-offset 4
	      indent-tabs-mode nil)
(add-hook 'c-mode-hook 'my-c-hook)

;; configure Latex style and path
(if (system-type-is-darwin)
    (setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
    (setq exec-path (append exec-path '("/Library/TeX/texbin"))))

(defun my-latex-hook ()
  (fci-mode)
  (setq fill-column 80)
  (setq TeX-PDF-mode t))

(add-hook 'LaTeX-mode-hook 'my-latex-hook)

;; configure Ruby style

(defun my-ruby-hook ()
  (fci-mode)
  (setq fill-column 80)
  (rubocop-mode))
(add-hook 'ruby-mode-hook 'my-ruby-hook)

;; configure Python style

(defun my-python-hook ()
  (fci-mode)
  (setq fill-column 79)
  (flycheck-mode))
(add-hook 'python-mode-hook 'my-python-hook)

;; magit-status keybind
(global-set-key (kbd "C-c g") 'magit-status)

;; powerline
(require 'powerline)
(powerline-evil-vim-color-theme)
