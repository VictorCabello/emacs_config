(require-package 'evil)
(evil-mode 1)
;; Togle input method
(defun evil-toggle-input-method ()
  "when toggle on input method, switch to evil-insert-state if possible.
    when toggle off input method, switch to evil-normal-state if current state is evil-insert-state"
  (interactive)
  (if (not current-input-method)
      (if (not (string= evil-state "insert"))
	  (evil-insert-state))
    (if (string= evil-state "insert")
	(evil-normal-state)
      ))
  (toggle-input-method))

(global-set-key (kbd "C-\\") 'evil-toggle-input-method)


;; Tabs
(load "elscreen" "ElScreen" t)
;; (elscreen-start)
;; (define-key evil-normal-state-map (kbd "C-w t") 'elscreen-create) ;creat tab
;; (define-key evil-normal-state-map (kbd "C-w x") 'elscreen-kill) ;kill tab
;; 
;; (define-key evil-normal-state-map "gT" 'elscreen-previous) ;previous tab
;; (define-key evil-normal-state-map "gt" 'elscreen-next) ;next tab

(provide 'evil-setup)
