;; no wellcome screen
(setq inhibit-startup-message t)
;; run maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(column-number-mode 1)
(global-display-line-numbers-mode t)
(setq linum-format "%4d \u2502 ")

(menu-bar-mode -1)              ; Disable the menu bar
(tool-bar-mode -1)              ; Disable the tool bar
(tooltip-mode -1)               ; Disable the tooltips

(set-face-attribute 'default nil :height 140 :font "Noto Sans Mono")

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '(("melpa" . "https://melpa.org/packages/")
               ("org" . "https://orgmode.org/elpa/")
               ("elpa" . "https://elpa.gnu.org/packages/")
               ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; increase/decrease text
(use-package emacs
  :bind
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<C-wheel-up>" . text-scale-increase)
  ("<C-wheel-down>" . text-scale-decrease))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

(use-package magit
  :commands magit-status)

;; Update all packages on Emacs startup
(add-hook 'emacs-startup-hook 'package-upgrade-all)


;;
;; auto-addition
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(which-key try)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
