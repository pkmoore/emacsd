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
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "10e231624707d46f7b2059cc9280c332f7c7a530ebc17dba7e506df34c5332c4" "82b67c7e21c3b12be7b569af7c84ec0fb2d62105629a173e2479e1053cff94bd" "4ab86c7682db09485a6e046ee0a6c45b5462f514c89844f4ed8b329aa1708067" "37def0fac11a4890922af9febc8394e3b6e3c68904a294a2d440b1904e979c7e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#383838")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(nrepl-message-colors
   (quote
    ("#336c6c" "#205070" "#0f2050" "#806080" "#401440" "#6c1f1c" "#6b400c" "#23733c")))
 '(package-selected-packages
   (quote
    (cyberpunk-theme darkokai-theme helm-ispell solarized-theme ruby-end ruby-electric rubocop rtags rspec-mode powerline-evil neotree markdown-mode+ magit-rockstar magit-find-file magit-filenotify linum-relative latex-extra idea-darkula-theme hgignore-mode helm-unicode helm-themes helm-swoop helm-pydoc helm-projectile helm-package helm-make helm-ls-svn helm-ls-hg helm-ls-git helm-git-grep helm-git-files helm-git helm-fuzzier helm-bibtexkey helm-bibtex helm-ack gruvbox-theme graphviz-dot-mode flymake-jshint evil-magit diredful dired-subtree ctags-update ctags column-marker column-enforce-mode auctex-latexmk anti-zenburn-theme 2048-game 0blayout)))
 '(pdf-view-midnight-colors (quote ("#232333" . "#c7c7c7")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#d4d4d4")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#437c7c")
     (40 . "#336c6c")
     (60 . "#205070")
     (80 . "#2f4070")
     (100 . "#1f3060")
     (120 . "#0f2050")
     (140 . "#a080a0")
     (160 . "#806080")
     (180 . "#704d70")
     (200 . "#603a60")
     (220 . "#502750")
     (240 . "#401440")
     (260 . "#6c1f1c")
     (280 . "#935f5c")
     (300 . "#834744")
     (320 . "#732f2c")
     (340 . "#6b400c")
     (360 . "#23733c"))))
 '(vc-annotate-very-old-color "#23733c")
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
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

