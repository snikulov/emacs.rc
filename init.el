;; initialize packages
(load "~/.emacs.d/conf/conf-packages.el")


;; http://stackoverflow.com/questions/1817257/how-to-determine-operating-system-in-elisp
;; ;; it's better to store platform as symbol, not as several symbols
(setq windows nil mac nil linux nil)
(cond
  ((eq system-type 'windows-nt) (setq windows t))
  ((eq system-type 'darwin) (setq mac t))
  (t (setq linux t)))

;; will use magit by default
(setq vc-handled-backends nil)

(setq platform (cond
  ((eq system-type 'windows-nt) 'windows) ;; should also handle 'cygwin?
  ((eq system-type 'darwin) 'mac)
  (t 'linux)))

(when (equal platform 'windows)
  (let (
        (myPathList
         [
          "C:/Program Files (x86)/Git/bin"
          "C:/Program Files/Git/bin"
          "C:/Program Files/Git/usr/bin"
          "C:/TOOLS/common/bin"
         ] )
        )
    (setenv "PATH" (mapconcat 'identity myPathList ";") )

    (setq exec-path (append myPathList (list "." exec-directory)) )
    ) )

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; common lisp enable for cedet
(require 'cl)

;; set lang to utf-8
(setenv "LANG" "en_US.UTF-8" )
(setenv "LC_ALL" "en_US.UTF-8" )


;; hide all menus, toolbars and scrollbars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; store backups in specified folder
(setq backup-directory-alist '(("" . "~/.emacs-backup")))
;; stop creating #autosave# files
(setq auto-save-default nil)

(setq ac-dwim t)
(setq yas/snippet-dirs '"~/.emacs.d/snippets")
(show-paren-mode 1)

;;(package-install 'yasnippet)
;;(package-install 'cmake-mode)
;;(package-install 'color-theme)
;;(package-install 'color-theme-almost-monokai)
;;(package-install 'color-theme-tango)
;;(package-install 'color-theme-tango-2)
;;(package-install 'color-theme-tangotango)
;;(package-install 'color-theme-sanityinc-tomorrow)
;;(package-install 'clang-format)
;;(package-install 'go-mode)
;;(package-install 'cpputils-cmake)
;;(package-install 'ggtags)
;;(package-install 'neotree)
;;(package-install 'evil-matchit)
;;(package-install 'magit)
;;(package-install 'atom-one-dark-theme)
;;(package-install 'color-theme-modern)

(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
;;  (color-theme-sanityinc-tomorrow-eighties)
(load-theme 'atom-one-dark t)

(when (equal platform 'linux)
  (set-face-attribute 'default nil :family "Droid Sans Mono" :height 182)
  (require 'cpputils-cmake)
  (require 'ggtags)
  (add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1)
              (cppcm-reload-all))))
)
(when (equal platform 'windows)
  (set-face-attribute 'default nil :family "Consolas" :height 143)
)

(load "~/.emacs.d/conf/conf-keyboard.el")
;;(load "~/.emacs.d/conf/emacs-rc-common-hooks.el")
;;(load "~/.emacs.d/conf/emacs-rc-auto-insert.el")
;;(load "~/.emacs.d/conf/emacs-rc-ccmode.el")
;;(load "~/.emacs.d/conf/conf-gtags.el")

;; cmake mode hook
(require 'cmake-mode)
(setq auto-mode-alist
	(append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
		auto-mode-alist))

;;(require 'go-mode)
;;(setq auto-mode-alist
;;	(append '(("\\.go\\'" . go-mode))
;;		auto-mode-alist))

;; nuke trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; additional ws options
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

;; default coding style
(setq c-default-style "bsd"
      c-basic-offset 4
      indent-tabs-mode nil)

(setq c++-default-style "bsd"
      c++-basic-offset 4
      indent-tabs-mode nil)



;;(require 'yasnippet)
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.d/snippets")
;;(yas/reload-all)

(global-linum-mode 1)
(global-hl-line-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   (quote
;;    (yasnippet neotree magit go-mode ggtags cpputils-cmake color-theme-sanityinc-tomorrow color-theme-modern color-theme cmake-mode clang-format atom-one-dark-theme))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
