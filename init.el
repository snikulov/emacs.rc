;;; init.el --- GNU Emacs Configuration

;; Make startup faster by reducing the frequency of garbage
;; collection.
(setq gc-cons-threshold (* 50 1000 1000))

(require 'package)
(package-initialize)

;; configure package archives
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (eval-when-compile (require 'use-package)))

(setq auth-sources '("~/.config/gnupg/shared/authinfo.gpg"
                     "~/.authinfo.gpg"
                     "~/.authinfo"
                     "~/.netrc"))
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
)

(setq-default
 ad-redefinition-action 'accept                   ; Silence warnings for redefinition
 cursor-in-non-selected-windows t                 ; Hide the cursor in inactive windows
 display-time-default-load-average nil            ; Don't display load average
 fill-column 80                                   ; Set width for automatic line breaks
 help-window-select t                             ; Focus new help windows when opened
 indent-tabs-mode nil                             ; Prefers spaces over tabs
 inhibit-startup-screen t                         ; Disable start-up screen
 initial-scratch-message ""                       ; Empty the initial *scratch* buffer
 kill-ring-max 128                                ; Maximum length of kill ring
 load-prefer-newer t                              ; Prefers the newest version of a file
 mark-ring-max 128                                ; Maximum length of mark ring
 read-process-output-max (* 1024 1024)            ; Increase the amount of data reads from the process
 scroll-conservatively most-positive-fixnum       ; Always scroll by one line
 select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
 tab-width 8                                      ; Set width for tabs
 use-package-always-ensure t                      ; Avoid the :ensure keyword for each package
 vc-follow-symlinks t                             ; Always follow the symlinks
 view-read-only t                                 ; Always open read-only buffers in view-mode
 require-final-newline t)                         ; add final newline (maybe not good in some cases)

(cd "~/")                                         ; Move to the user directory
(column-number-mode 1)                            ; Show the column number
(display-time-mode 1)                             ; Enable time in the mode-line
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts with y/n
(global-hl-line-mode 1)                           ; Hightlight current line
(set-default-coding-systems 'utf-8)               ; Default to utf-8 encoding
(show-paren-mode 1)                               ; Show the parent
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

(menu-bar-mode -1)              ; Disable the menu bar
(tool-bar-mode -1)              ; Disable the tool bar
(tooltip-mode -1)               ; Disable the tooltips

;; default coding style
(setq c-default-style "bsd"
      c-basic-offset 4
      indent-tabs-mode nil)
(setq c++-default-style "bsd"
      c++-basic-offset 4
      indent-tabs-mode nil)
(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)

;; Packages stuff
(use-package dtrt-indent
  :hook (prog-mode . dtrt-indent-mode))

(use-package delight)
(use-package use-package-ensure-system-package)

;; delete trailing whitespace on save
(use-package simple
  :ensure nil
  :hook (before-save . delete-trailing-whitespace))
(use-package all-the-icons
  :defer 0.5)
;; neotree on f8
(use-package neotree
  :custom (neo-show-hidden-files t)
  :bind ("<f8>" . neotree-toggle))

;;
;; Themes
;;
;; start the initial frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; start every frame maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(use-package command-log-mode
  :commands command-log-mode)

(use-package undo-tree
    :defer 5
    :config
    (global-undo-tree-mode 1))

(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Source Code Pro Medium-16")
  (set-fontset-font t 'latin "Noto Sans")
  (scroll-bar-mode -1)            ; Disable the scroll bar
  (use-package doom-themes
    :config (load-theme 'doom-nord t))
  (use-package doom-modeline
    :defer 0.1
    :config (doom-modeline-mode))
  (use-package fancy-battery
    :after doom-modeline
    :hook (after-init . fancy-battery-mode))
)
(unless (display-graphic-p)
  (use-package monokai-theme
    :config (load-theme 'monokai t)))

(use-package solaire-mode
  :custom (solaire-mode-remap-fringe t)
  :config
  (setq solaire-mode-swap-bg t)
  (solaire-global-mode +1))

(use-package ggtags
  :hook (prog-mode . ggtags-mode))

(use-package lsp-mode
  :commands lsp
  :hook ((c-mode c++-mode json-mode python-mode xml-mode) . lsp)
  :after projectile
  :custom
  (lsp-enable-folding nil)
  (lsp-enable-links nil)
  (lsp-enable-snippet nil)
  (lsp-prefer-flymake nil)
  (lsp-restart 'auto-restart)
  :config
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))
  )

(use-package lsp-ui)

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/work")
    (setq projectile-project-search-path '("~/work")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package dts-mode
  :mode ("\\.dts\\'" "\\.dtsi\\'"))

(use-package cmake-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(use-package cmake-font-lock
  :after (cmake-mode)
  :hook (cmake-mode . cmake-font-lock-activate))

(use-package cmake-ide
  :after projectile
  :hook ((c-mode c++-mode) . my/cmake-ide-find-project)
  :preface
  (defun my/cmake-ide-find-project ()
    "Finds the directory of the project for cmake-ide."
    (with-eval-after-load 'projectile
      (setq cmake-ide-project-dir (projectile-project-root))
      (setq cmake-ide-build-dir (concat cmake-ide-project-dir "build")))
    (setq cmake-ide-compile-command
          (concat "cmake -S" cmake-ide-project-dir " -B" cmake-ide-build-dir " -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build " cmake-ide-build-dir))
    (cmake-ide-load-db))

  (defun my/switch-to-compilation-window ()
    "Switches to the *compilation* buffer after compilation."
    (other-window 1))
  :bind ([remap comment-region] . cmake-ide-compile)
  :init (cmake-ide-setup)
  :config (advice-add 'cmake-ide-compile :after #'my/switch-to-compilation-window))


(use-package yasnippet-snippets
  :after yasnippet
  :config (yasnippet-snippets-initialize))

(use-package yasnippet
  :delight yas-minor-mode " υ"
  :config
    (yas-global-mode)
    (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets"))

(use-package rainbow-mode
  :delight
  :hook (prog-mode))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :defer 0.2
  :delight
  :config (which-key-mode))

(use-package counsel
  :after ivy
  :delight
  :bind (("C-x C-d" . counsel-dired-jump)
         ("C-x C-h" . counsel-minibuffer-history)
         ("C-x C-l" . counsel-find-library)
         ("C-x C-r" . counsel-recentf)
         ("C-x C-u" . counsel-unicode-char)
         ("C-M-j" . counsel-switch-buffer)
         ("C-x C-v" . counsel-set-variable))
  :config (counsel-mode 1)
  :custom (counsel-rg-base-command "rg -S -M 150 --no-heading --line-number --color never %s"))

(use-package ivy
  :delight
  :after ivy-rich
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("M-H"   . ivy-resume)
         :map ivy-minibuffer-map
         ("<tab>" . ivy-alt-done)
         ("C-i" . ivy-partial-or-done)
         ("S-SPC" . nil)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-switch-buffer-kill))
  :custom
  (ivy-case-fold-search-default t)
  (ivy-count-format "(%d/%d) ")
  (ivy-re-builders-alist '((t . ivy--regex-plus)))
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package avy
  :bind ("<f5>" . avy-goto-line))

(use-package ivy-avy)

(use-package ivy-rich
  :defer 0.1
  :config (ivy-rich-mode 1))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         :map swiper-map
         ("M-%" . swiper-query-replace)))

(use-package company
  :defer 0.5
  :delight
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay 0)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))

(use-package company-box
  :after company
  :delight
  :hook (company-mode . company-box-mode))

;; override my default settings with editorconfig for project (if any)
(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; TODO: configure
(use-package clang-format)
(use-package hydra
  :bind (("C-c m" . hydra-magit/body)))
(use-package pretty-hydra)
(use-package all-the-icons)

;;(use-package sourcetrail)
(use-package magit)
(use-package flycheck)
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(pretty-hydra-define hydra-magit
  (:hint nil :color teal :quit-key "q" :title "Magit")
  ("Action"
   (("b" magit-blame "blame")
    ("c" magit-clone "clone")
    ("i" magit-init "init")
    ("l" magit-log-buffer-file "commit log (current file)")
    ("L" magit-log-current "commit log (project)")
    ("s" magit-status "status"))))


;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 10 1000 1000))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   '("be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default))
 '(display-time-mode t)
 '(package-selected-packages '(dracula-theme use-package))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 158 :width normal)))))
