;;; package --- Summary
;;;
;;; Commentary:
;;; I need to figure out how to get flycheck to chill out
;;;
;;;
;;; -------------------------
;;; .emacs.d/init.el 'lenards
;;; -------------------------
;;;
;;; Code:
;;;
;;; Pulled from MELPA Getting Started
;;; (:url "https://melpa.org/#/getting-started")
;;;
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(menu-bar-mode -1)

(require 'editorconfig)
(editorconfig-mode 1)

(setq auto-save-default nil)
(setq make-backup-files nil)
;; if you allow backup-files, then provide a location:
;; (setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

(eval-after-load "js2-highlight-vars-autoloads"
  '(add-hook 'js2-mode-hook (lambda () (js2-highlight-vars-mode))))

(require 'git-gutter)
(global-git-gutter-mode +1)
(add-hook 'python-mode-hook 'git-gutter-mode)
(add-hook 'js2-mode-hook 'git-gutter-mode)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers
	      (append flycheck-disabled-checkers
		      '(javascript-jshint
			emacs-lisp-checkdoc)))

(flycheck-add-mode 'javascript-eslint 'web-mode)
;;(global-flycheck-mode)

(require 'projectile)
(projectile-global-mode)
(add-hook 'js2-mode-hook 'projectile-mode)

(require 'helm-config)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x m") 'helm-M-x)

(require 'helm-projectile)
(helm-projectile-on)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
;; melpa installed were failing 8/5/2016:
;; installed via homebrew-
;;Emacs Lisp files have been installed to:
;;  /usr/local/share/emacs/site-lisp/yaml-mode

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.j2\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.react.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq web-mode-content-types-alist
      '(("json" . "\\.json\\'")
	("jsx"  . "\\.js[x]?\\'")
	("jsx"  . "\\.react.js\\'")))


(defun my-web-mode-hook ()
    "Hooks for Web mode."
    (show-paren-mode 1)
    (add-hook 'local-write-file-hooks
	      (lambda ()
		(delete-trailing-whitespace)
		nil))
    (set-face-attribute 'web-mode-html-tag-bracket-face
			nil :foreground "Pink3")
)

(add-hook 'web-mode-hook  'my-web-mode-hook)

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(require 'rainbow-mode)
(add-to-list 'auto-mode-alist '("\\.css?\\'" . rainbow-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . rainbow-mode))

(require 'tern)
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))


;;; Blog Surfin' for Fun & Project
;;;
;;; Excerpt from:
;;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;;;
;;; https://github.com/purcell/exec-path-from-shell
;;; only need exec-path-from-shell on OSX
;;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; Below were added when _enabled_

(add-to-list 'custom-theme-load-path "~/.emacs.d/custom-themes")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages
   (quote
    (emmet-mode feature-mode gherkin-mode markdown-mode yaml-mode web-mode tern-auto-complete smart-mode-line-powerline-theme json-mode js3-mode js2-highlight-vars helm-swoop helm-projectile helm-mode-manager helm-flycheck git-gutter exec-path-from-shell editorconfig))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "color-245" :distant-foreground "color-237")))))

;;; init.el ends here
