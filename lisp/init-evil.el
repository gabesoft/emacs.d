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

;; Window resizing
(define-key evil-normal-state-map (kbd "<up>") 'evil-window-increase-height)
(define-key evil-normal-state-map (kbd "<down>") 'evil-window-decrease-height)
(define-key evil-normal-state-map (kbd "<right>") 'evil-window-increase-width)
(define-key evil-normal-state-map (kbd "<left>") 'evil-window-decrease-width)

;; Use "C-b" for scrolling up
;; (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
;; (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
;; (define-key evil-insert-state-map (kbd "C-u")
;;             (lambda ()
;;               (interactive)
;;               (evil-delete (point-at-bol) (point))))

;; Leader
(require-package 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "e" 'find-file
  "f" 'helm-projectile
  "b" 'switch-to-bufer
  "k" 'kill-bufer)

;; Nerd Commenter
(require-package 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(define-key evil-normal-state-map (kbd "gcc") 'evilnc-comment-or-uncomment-lines)

(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator)

(provide 'init-evil)
