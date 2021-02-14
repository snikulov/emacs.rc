(require 'package)

(package-initialize)

(add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/"))
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; my packages
;; magit
(use-package magit)

(use-package company)

(use-package yasnippet)
(use-package auto-complete)

(use-package atom-one-dark-theme)
(use-package gruber-darker-theme)
(use-package nord-theme)

(use-package cpputils-cmake)
(use-package cmake-mode)
(use-package go-mode)
;;(use-package python-mode)
(use-package ggtags)
(use-package clang-format)
(use-package neotree)
(use-package hydra)
(use-package ivy)
(use-package flx-ido)
(use-package gnus)
(use-package projectile)
(use-package term-projectile)
(use-package popup-switcher)
