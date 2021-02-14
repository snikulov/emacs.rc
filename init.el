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
;;(require 'cl)

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

(load-theme 'gruber-darker t)

(when (equal platform 'linux)
  (require 'cpputils-cmake)
  (require 'ggtags)
  (add-hook 'c-mode-common-hook
          (lambda ()
             (when (derived-mode-p 'c-mode 'c++-mode)
               (ggtags-mode 1)
               (cppcm-reload-all))))
)
;;; Appearance
(defun rc/get-default-font ()
  (cond
   ((eq system-type 'windows-nt) "Consolas-13")
   ((eq system-type 'gnu/linux) "Ubuntu Mono-20")))

(add-to-list 'default-frame-alist `(font . ,(rc/get-default-font)))

(load "~/.emacs.d/conf/conf-keyboard.el")
(load "~/.emacs.d/conf/conf-gtags.el")

;; nuke trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(company-tng-configure-default)

;; additional ws options
(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

(ido-mode t)
(setq ido-everywhere            t
      ido-enable-prefix         nil
      ido-enable-flex-matching  t
      ido-auto-merge-work-directories-length nil
      ;;ido-use-filename-at-point t
      ido-max-prospects         10
      ido-create-new-buffer     'always
      ;; ido-use-virtual-buffers   t
      ;; ido-handle-duplicate-virtual-buffers 2
      ido-default-buffer-method 'selected-window
      ido-default-file-method   'selected-window)
(defun ido-my-keys ()
  (define-key ido-completion-map (kbd "<up>")   'ido-prev-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match))

(setq ido-file-extensions-order     '(".cc" ".h" ".tex" ".sh" ".org"
                                      ".el" ".tex" ".png"))
(setq completion-ignored-extensions '(".o" ".elc" "~" ".bin" ".bak"
                                      ".obj" ".map" ".a" ".so"
                                      ".mod" ".aux" ".out" ".pyg"))
(setq ido-ignore-extensions t)
(setq ido-ignore-buffers (list (rx (or (and bos  " ")
                                       (and bos
                                            (or "*Completions*"
                                                "*Shell Command Output*"
                                                "*vc-diff*")
                                            eos)))))

(add-hook 'ido-setup-hook 'ido-my-keys)
;; flx ido mode
(require 'flx-ido)
(flx-ido-mode 1)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; default coding style
(setq c-default-style "bsd"
      c-basic-offset 4
      indent-tabs-mode nil)

(setq c++-default-style "bsd"
      c++-basic-offset 4
      indent-tabs-mode nil)

(global-linum-mode 1)
(global-hl-line-mode 1)

(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" default))
 '(package-selected-packages
   '(## yasnippet use-package neotree magit ggtags cpputils-cmake company atom-one-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
