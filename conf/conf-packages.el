(require 'package)

(package-initialize)

(add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
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

(use-package atom-one-dark-theme)

(use-package cpputils-cmake)
(use-package ggtags)
(use-package neotree)
(use-package hydra)
(use-package ivy)

(use-package gnus)
(use-package projectile)
(use-package term-projectile)
(use-package popup-switcher)
