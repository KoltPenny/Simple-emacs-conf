(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(backup-directory-alist '((".*" . "/home/kolt/.saves")))
 '(custom-safe-themes
   '("e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065" default))
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(company-go gdscript-mode doom-modeline doom-themes lsp-mode go-complete go-autocomplete elixir-mode csv-mode yaml-mode emacsql emacsql-mysql slime web-mode vue-mode php-mode memoize gited flycheck bison-mode))
 '(pop-up-frames nil)
 '(typescript-indent-level 2))

(package-initialize)
(setq shell-command-switch "-ic")

;;Load Theme
(load-theme 'doom-rouge t)
;Transparency
(set-frame-parameter (selected-frame) 'alpha '(85 50))
;;Load PATH

;;Enable LSṔ
(require 'lsp-mode)
(require 'dash)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;;Set your lisp system and, optionally some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(setq slime-lisp-implementations
      '((sbcl ("/usr/bin/sbcl")
	      :coding-system utf-8-unix
	      :env ("SBCL_HOME=/usr/lib/sbcl"))))
	
;; Configuration
(setq create-lockfiles nil)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 1)

(put 'set-goal-column 'disabled nil)

;;KEYBINDS
;(global-set-key "\C-z" 'highlight-symbol)
(global-set-key "\C-z" 'replace-string)
(global-set-key '[8711] 'nil)
;Move between windows
(global-set-key (kbd "C-c b")  'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p")    'windmove-up)
(global-set-key (kbd "C-c n")  'windmove-down)


(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;(set-frame-parameter nil 'fullscreen 'fullboth)
(require 'iso-transl)

(electric-pair-mode 1)

(set-face-attribute 'default nil :font "OCR A Std-9")

;;Golang Configuration


;;Python Configuration
(add-hook 'python-mode-hook 'anaconda-mode)
(setq python-shell-interpreter "python3")
(add-to-list 'exec-path "/home/kolt/.bashrc")

(setq js-indent-level 2)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)


(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;;Controls
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;;ESHELL
(setq eshell-prompt-function
			(lambda () (concat (car (last (split-string (eshell/pwd) "/"))) " $ ")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
