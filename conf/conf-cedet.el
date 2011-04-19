;; borrowed from here http://cxwangyi.wordpress.com/2010/08/21/using-cedet-with-emacs/
;; I believe Alex Ott was here

;; Subject to change, because I'm not sure about keybindings
;; and global includes

(load-file "~/emacs.rc/cedet/common/cedet.el")
;;(global-ede-mode 'nil) ;; do not use project manager so far
(semantic-load-enable-excessive-code-helpers)

(setq senator-minor-mode-name "SeN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)

(require 'semantic-decorate-include)
(require 'semantic-ia)
(require 'semantic-gcc)
;; add includes here
;; boost
;;(semantic-add-system-include "~/projects/libs/boost/include/boost-1_46_1" 'c++-mode)

(require 'semanticdb)
(global-semanticdb-minor-mode 1)

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(require 'eassist)

(defun local-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key (kbd "C->") 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
  (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
  (local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
  (local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)
  )
(add-hook 'c-mode-common-hook 'local-cedet-hook)

(defun autocompl-c-mode-cedet-hook ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'autocompl-c-mode-cedet-hook)

(global-semantic-tag-folding-mode 1)

;(concat essist-header-switches ("hh" "cc"))
(defun localcedet/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )

(add-hook 'c-mode-common-hook 'localcedet/c-mode-cedet-hook)

;; gnu global support
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; ctags
(require 'semanticdb-ectag)
(semantic-load-enable-primary-exuberent-ctags-support)

(require 'semantic-lex-spp)
(global-ede-mode t)
(ede-enable-generic-projects)

;;(global-semantic-idle-tag-highlight-mode 1)


;;Using CEDET

;;control return: whatever the symbol you are typing, this hot key automatically complete it for you.
;;C-c?: another way to complete the symbol you are typing
;;C-c>: when you typed . or -> after an object name, use this key to show possible public member functions or data members.
;;C-cj: jump to the definition of the symbol under cursor
;;C-cs: show a summary about the symbol under cursor
;;C-cq: show the document of the symbol under cursor
;;C-c=: visit the header file under cursor
;;C-cp: toggle between the implementation and a prototype of symbol under cursor
;;C-ce: when your cursor is in the scope of a class or one of its member function, list all methods in the class
;;C-cC-r: show references of the symbol under cursor
;;C-cC-c-: fold all
;;C-cC-c+: unfold all
;;C-c-: fold the block under cursor
;;C-c+: unfold the block under cursor