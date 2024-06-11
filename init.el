;PACKAGE REPOSITORIES
(setq package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))

;;PACKAGES LOAD
(add-to-list 'load-path "~/.emacs.d/manual")
(add-to-list 'load-path "~/.emacs.d/manual/nginx-mode")
(add-to-list 'load-path "~/.emacs.d/manual/sly")
(add-to-list 'load-path "~/.emacs.d/manual/lua-mode")
(add-to-list 'load-path "~/.emacs.d/manual/emacs-gdscript-mode")


;;APPEARANCE
(setq auth-source-save-behavior nil)
(setq backup-directory-alist `(("." . , (concat user-emacs-directory "/home/kolt/.saves"))))
(setq inhibit-startup-screen t)
(setq pop-up-frames nil)
(setq cursor-type 'hollow)
(setq border-width 0)
;;(setq frame-fullscreen t)
(setq column-number-mode t)
(setq-default show-trailing-whitespace t)
(setenv "ECONF" "~/.emacs.d/init.el")
(setenv "STF" "/ssh:Stefanini@stefamac:~/go/src/gitlab.krakenmx.wtf")
(setenv "SERVER" "/ssh:root@koltpenny.com#11822:~")

;;Frame and behaviour config
(set-frame-parameter nil 'fullscreen 'fullboth)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 1)


;;Relative numbered lines
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;;TOOLS
;;Reformatter
(require 'reformatter)
;;Sly
(require 'sly)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
;;Eglot
(require 'eglot)
;;Org Modern
(require 'org-modern)
(with-eval-after-load 'org (global-org-modern-mode))
;;Company
(require 'company)
(require 'company-abbrev)
(require 'company-bbdb)
(require 'company-capf)
(require 'company-clang)
(require 'company-cmake)
(require 'company-css)
(require 'company-dabbrev-code)
(require 'company-dabbrev)
(require 'company-etags)
(require 'company-files)
(require 'company-gtags)
(require 'company-ispell)
(require 'company-keywords)
(require 'company-nxml)
(require 'company-oddmuse)
(require 'company-semantic)
(require 'company-template)
(require 'company-tempo)
(require 'company-tests)
(require 'company-tng)
(require 'company-yasnippet)
(add-hook 'after-init-hook 'global-company-mode)
;Languages
(require 'go-mode)
(require 'zig-mode)
(require 'lua-mode)
(require 'protobuf-mode)
(require 'web-mode)
(require 'dockerfile-mode)
(require 'gdscript-mode)
(require 'nginx-mode)

;;Themes
(require 'moe-dark-theme)
(require 'moe-light-theme)
(require 'moe-theme)

(load-theme 'moe-dark t)

;;Controls
;Key mods
(global-set-key "\C-z" 'replace-string)
(global-set-key '[8711] 'nil)
;Resize
(global-set-key (kbd "C-S-b") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-f") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-n") 'shrink-window)
(global-set-key (kbd "C-S-p") 'enlarge-window)
;Move between windows
(global-set-key (kbd "C-s-b")  'windmove-left)
(global-set-key (kbd "C-s-f") 'windmove-right)
(global-set-key (kbd "C-s-p")    'windmove-up)
(global-set-key (kbd "C-s-n")  'windmove-down)

(electric-pair-mode 1)
(add-to-list 'exec-path "/home/kolt/.bashrc")

;;Tabs and indents
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)

;;Web Mode hooks
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)


(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;;Load PATH
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

;;Set ESHELL Prompt
(setq eshell-prompt-function
      (lambda ()
	(concat (car (last (split-string (eshell/pwd) "/"))) " $ ")))

;;EVAL-BUFFER
(add-hook 'emacs-lisp-mode-hook
          (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-buffer))
