;; http://stackoverflow.com/questions/1817257/how-to-determine-operating-system-in-elisp
;; ;; it's better to store platform as symbol, not as several symbols
(setq windows nil mac nil linux nil)
(cond
  ((eq system-type 'windows-nt) (setq windows t))
  ((eq system-type 'darwin) (setq mac t))
  (t (setq linux t)))

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

;;(load "~/.emacs.d/el-get-install.el")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;(load "~/.emacs.d/gtags.el")
;; common lisp enable for cedet
(require 'cl)


;; set environment for ErgoEmacs - Dvorak keyboard layout
;;(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")

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

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'el-get)
(require 'delsel)
(require 'log-edit)
;;(el-get-emacswiki-refresh)

(setq ac-dwim t)
(setq yas/snippet-dirs '"~/.emacs.d/snippets")

(when (equal platform 'linux)
  (setq my-packages
        '(delsel
;;          ergoemacs-mode
          yasnippet
          auto-complete
          color-theme
          color-theme-almost-monokai
          color-theme-tango
          color-theme-tango-2
          color-theme-tangotango
          cmake-mode
          clang-format
          go-mode
;;          org-mode
;;          xgtags xgtags-extension
          ))
)

(when (equal platform 'windows)
  (setq my-packages
        '(
;;          ergoemacs-mode
          yasnippet auto-complete cmake-mode
          color-theme
          color-theme-almost-monokai color-theme-tango
          color-theme-tango-2 color-theme-tangotango
          go-mode
          ))
)

(el-get 'sync my-packages)

(load "~/.emacs.d/conf/conf-keyboard.el")
;;(load "~/.emacs.d/conf/emacs-rc-common-hooks.el")
(load "~/.emacs.d/conf/emacs-rc-auto-insert.el")
;;(load "~/.emacs.d/conf/emacs-rc-ccmode.el")
(load "~/.emacs.d/conf/conf-gtags.el")

;; cmake mode hook
(require 'cmake-mode)
(setq auto-mode-alist
	(append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
		auto-mode-alist))

(require 'go-mode)
(setq auto-mode-alist
	(append '(("\\.go\\'" . go-mode))
		auto-mode-alist))

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


(when (equal platform 'linux)
  (require 'color-theme)
  (color-theme-initialize)
  (setq color-theme-is-global t)
  (color-theme-euphoria)
  (color-theme-almost-monokai)
  (set-face-attribute 'default nil :family "Droid Sans Mono" :height 182)
)

(require 'yasnippet)
;;(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")
(yas/reload-all)


(when (equal platform 'windows)
  (require 'color-theme)
  (color-theme-initialize)
  (setq color-theme-is-global t)
  (color-theme-euphoria)
  (color-theme-almost-monokai)
  (set-face-attribute 'default nil :family "Consolas" :height 143)
)
