;;; package --- Summary

;;; Commentary:
;;  Evil mode settings


;;; Code:

(require-package 'evil)
(evil-mode t)

(setq evil-motion-state-modes (append evil-emacs-state-modes
                                      evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

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
(define-key evil-insert-state-map (kbd "C-t") 'transpose-chars)

;; Ace-jump integration
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-line-mode)
(define-key evil-normal-state-map (kbd "C-SPC") 'ace-jump-word-mode)
(define-key evil-normal-state-map (kbd "C-<return>") 'ace-jump-char-mode)

(defadvice evil-visual-line (before spc-for-line-jump activate)
  "In visual line mode press space to activate line-mode."
  (define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-line-mode))
(defadvice evil-visual-char (before spc-for-char-jump activate)
  "In visual mode press space to activate char-mode."
  (define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-char-mode))
(defadvice evil-visual-block (before spc-for-char-jump activate)
  "In visual block mode press space to activate char-mode."
  (define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-char-mode))

;; Save on insert exit
(add-hook 'evil-insert-state-exit-hook (lambda ()
                                         (if (buffer-file-name)
                                             (evil-save (buffer-file-name) t))))

;; Window resizing
(define-key evil-normal-state-map (kbd "<up>") 'evil-window-increase-height)
(define-key evil-normal-state-map (kbd "<down>") 'evil-window-decrease-height)
(define-key evil-normal-state-map (kbd "<right>") 'evil-window-increase-width)
(define-key evil-normal-state-map (kbd "<left>") 'evil-window-decrease-width)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

;; Leader
(require-package 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-leader/set-key
  "A" 'ag
  "a" 'ag-project
  "b" 'switch-to-buffer
  "e" 'find-file
  "f" 'helm-projectile
  "k" 'kill-buffer
  "w" 'save-buffer
  "d" 'dired-jump
  "x" 'helm-M-x
  "p" 'helm-show-kill-ring)

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

;;; init-evil.el ends here
