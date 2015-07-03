(require-package 'evil)
(evil-mode t)

(when (display-graphic-p)
  (setq evil-emacs-state-cursor '("#DC322F" box))
  (setq evil-normal-state-cursor '("#268BD2" box))
  (setq evil-visual-state-cursor '("#D33682" box))
  (setq evil-insert-state-cursor '("#859900" bar))
  (setq evil-replace-state-cursor '("#DC322F" hbar))
  (setq evil-operator-state-cursor '("#DC322F" hollow)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-line-mode)

;; Use "C-b" for scrolling up
;; (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
;; (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
;; (define-key evil-insert-state-map (kbd "C-u")
;;             (lambda ()
;;               (interactive)
;;               (evil-delete (point-at-bol) (point))))

(provide 'init-evil)
