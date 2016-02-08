(require 'generic-x)
(require 'package)
    (package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'evil)
    (evil-mode 1)
(require 'helm-config)
    (helm-mode 1)
    (global-set-key (kbd "M-x") 'helm-M-x)
(global-linum-mode t)
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
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'solarized-dark)
(setq inhibit-startup-message t)
(setq exec-path (append exec-path '("/Library/TeX/texbin")))
(tool-bar-mode -1)
