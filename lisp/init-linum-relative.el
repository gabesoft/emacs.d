;;; init-linum-relative.el --- Summary

;;; Commentary:
;;; emacs configuration

;;; Code:

(require-package 'linum-relative)

(after-load 'linum-relative
  (defun bw/linum-non-relative (line-number)
    "Linum formatter that copies the format"
    (propertize (format linum-relative-format line-number)
                'face 'linum))

  (defun bw/linum-relative-formatting ()
    "Turn on relative formatting"
    (setq-local linum-format 'linum-relative))

  (defun bw/linum-normal-formatting ()
    "Turn on non-relative formatting"
    (setq-local linum-format 'bw/linum-non-relative))

  ;; I never use linum-mode except for this, so it's okay to
  ;; clobber it
  (setq linum-format 'bw/linum-non-relative
        ;; show >> on line where cursor is
        linum-relative-current-symbol ">>")

  ;; in Normal mode, use relative numbering
  (add-hook 'evil-normal-state-entry-hook 'bw/linum-relative-formatting)
  ;; in Insert mode, use normal line numbering
  (add-hook 'evil-insert-state-entry-hook 'bw/linum-normal-formatting)
  ;; turn off linum mode automatically when entering Emacs mode
  (add-hook 'evil-emacs-state-entry-hook 'bw/disable-linum-mode)
  ;; turn off linum mode when entering Emacs
  (add-hook 'evil-emacs-state-entry-hook 'bw/linum-normal-formatting)

  ;; copy linum face so it doesn't look weird
  (set-face-attribute 'linum-relative-current-face nil :foreground (face-attribute 'font-lock-keyword-face :foreground) :background nil :inherit 'linum :bold t))


(require 'linum-relative)
(global-linum-mode t)

(provide 'init-linum-relative)
;;; init-linum-relative.el ends here
