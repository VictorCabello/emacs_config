;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Setup packages
(require 'setup-package)

;; Setup monokai
(require-package 'monokai-theme) 
(load-theme 'monokai t)

;; Setup ace-jump-mode
(require-package 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
;; When org-mode starts it (org-mode-map) overrides the ace-jump-mode.
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "\C-c SPC") 'ace-jump-mode)))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Setup neotree
(require-package 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Setup magit
(require-package 'magit)

;; Setup groovy
(require-package 'groovy-mode)

;; Setup gradle
(if (and (= emacs-major-version 24) (< emacs-minor-version 5))
    (require 'cl))
(require-package 'gradle-mode)


;; Setup autocomplete
(require 'init-auto-complete) 

;; Setup Multiple major modes
(require 'init-mmm)

;; Setup evil-mode
(require 'evil-setup)

;; No tabs
(setq-default indent-tabs-mode nil)

;; SEtup emmet
(require 'init-emmet)
