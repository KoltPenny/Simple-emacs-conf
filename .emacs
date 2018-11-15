;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(backup-directory-alist (quote ((".*" . "/home/kolt/.saves"))))
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
	 (quote
		("f77b66fa762568d66fc00a5e2013aae76d78f0142669c55b7eb3c8e5d4d41e7d" default)))
 '(erc-button-mode t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(menu-bar-mode nil)
 '(minibuffer-frame-alist (quote ((width . 80) (height . 1))))
 '(package-archives
	 (quote
		(("gnu" . "http://elpa.gnu.org/packages/")
		 ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-selected-packages
	 (quote
		(gited bison-mode vue-html-mode vue-mode go-mode web-mode php-mode anaconda-mode slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#181a26" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 135 :width normal :family "Terminus"))))
 '(erc-current-nick-face ((t (:foreground "violet" :weight bold))))
 '(erc-direct-msg-face ((t (:foreground "turquoise"))))
 '(erc-input-face ((t (:foreground "tomato"))))
 '(erc-my-nick-face ((t (:foreground "dark gray" :weight bold))))
 '(erc-nick-default-face ((t (:slant italic :weight bold))))
 '(erc-notice-face ((t (:foreground "SteelBlue2" :weight bold))))
 '(erc-pal-face ((t (:foreground "orange red" :weight bold))))
 '(erc-timestamp-face ((t (:foreground "goldenrod" :weight bold)))))

;;Set your lisp system and, optionally some contribs
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(setq slime-lisp-implementations
      '((sbcl ("/usr/bin/sbcl")
	      :coding-system utf-8-unix
	      :env ("SBCL_HOME=/usr/lib/sbcl"))))
	
;; Configuration
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(put 'set-goal-column 'disabled nil)
(global-set-key "\C-z" 'highlight-symbol)
(global-set-key "\C-q" 'replace-string)
(global-set-key '[8711] 'nil)
(setq-default tab-width 2)
(require 'iso-transl)

(electric-pair-mode 1)

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
