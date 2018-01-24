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

;; @see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
(eval-after-load 'ggtags
  '(progn
     (evil-make-overriding-map ggtags-mode-map 'normal)
     ;; force update evil keymaps after ggtags-mode loaded
     (add-hook 'ggtags-mode-hook #'evil-normalize-keymaps)))

;; enable and configure helm
(require 'helm-config)
(helm-mode 1)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

;; enable line numbers all the time
;;(global-nlinum-mode t)
;;(setq-default nlinum-format "%d ")
;;(linum-relative-global-mode)
;;(helm-linum-relative-mode)

(require 'hl-line)

;; disable menu bar
(menu-bar-mode -1)

(defface my-linum-hl
  `((t :inherit linum :background ,(face-background 'hl-line nil t)))
  "Face for the current line number."
  :group 'linum)

(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

(defun my-linum-get-format-string ()
  (let* ((width (1+ (length (number-to-string
                             (count-lines (point-min) (point-max))))))
         (format (concat "%" (number-to-string width) "d \u2502")))
    (setq my-linum-format-string format)))

(defvar my-linum-current-line-number 0)

(setq linum-format 'my-linum-format)

(defun my-linum-format (line-number)
  (propertize (format my-linum-format-string line-number) 'face
              (if (eq line-number my-linum-current-line-number)
                  'my-linum-hl
                'linum)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)
(global-linum-mode t)
(global-hl-line-mode t)

;; enable and configure projectile-related stuff
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-find-dir-includes-top-level t)

;; store customizations in separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; set appropriate theme (must occurr after the custom safe themes stuff)
;(load-theme 'darkokai)
(load-theme 'whiteboard)

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
  (setq fill-column 80)
  (ggtags-mode))

(setq-default c-default-style "stroustrup"
	      c-basic-offset 2
	      indent-tabs-mode nil)
(add-hook 'c-mode-hook 'my-c-hook)

;; configure Latex style and path
(if (system-type-is-darwin)
    (progn
        (setenv "PATH" "/usr/local/Cellar/node/6.2.1/bin:/usr/local/bin:/Library/TeX/texbin/:$PATH" t)
        (setq exec-path (append exec-path '("/Library/TeX/texbin")))
        (setq exec-path (append exec-path '("/usr/local/Cellar/node/6.2.1/bin")))
        (setq ispell-program-path "/usr/local/bin/ispell")))

(defun my-latex-hook ()
  (auto-fill-mode)
  (set-fill-column 120)
  (setq TeX-PDF-mode t))

(add-hook 'LaTeX-mode-hook 'my-latex-hook)

;; configure CPP style
(defun my-cpp-hook ()
  (setq fill-column 80)
  (helm-gtags-mode))

(add-hook 'c++-mode-hook 'my-cpp-hook)


;; configure Ruby style

(defun my-ruby-hook ()
  (setq fill-column 80)
  (rubocop-mode))
(add-hook 'ruby-mode-hook 'my-ruby-hook)

;; configure Python style

(defun my-python-hook ()
  (setq fill-column 79)
  (flycheck-mode))
(add-hook 'python-mode-hook 'my-python-hook)

;; magit-status keybind
(global-set-key (kbd "C-c g") 'magit-status)

;; powerline
(require 'powerline)
(powerline-evil-vim-color-theme)

;; Backup file configuration
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5)    ; and how many of the old

;; Auto save file configuration
(setq auto-save-file-name-transforms
            `((".*" "~/.emacs.d/autosave" t)))
;; neotree
(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
(global-set-key (kbd "C-c t") 'neotree-toggle)

