(require 'generic-x)
(require 'package)
    (package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; enable and configure evil mode
(require 'evil)
    (evil-mode 1)

;; enable and configure helm
(require 'helm-config)
    (helm-mode 1)
    (global-set-key (kbd "M-x") 'helm-M-x)

;; enable line numbers all the time
(global-linum-mode t)

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
    ("37def0fac11a4890922af9febc8394e3b6e3c68904a294a2d440b1904e979c7e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set appropriate theme (must occurr after the custom safe themes stuff)
(load-theme 'manoj-dark)

;; disable the startup message buffer
(setq inhibit-startup-message t)

;; disable the ugly toolbar when starting in window mode
(tool-bar-mode -1)

;; disable the messages buffer by setting its size to nil and killing
;; the existing buffer on startup
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; hilight text past the 80th column
(column-enforce-mode 1)

;; configure C indenting style
(setq-default c-default-style "stroustrup"
	      c-basic-offset 4
	      indent-tabs-mode nil)

;; enable gitgutter
(global-git-gutter-mode +1)
