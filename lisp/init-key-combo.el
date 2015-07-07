;;; package --- Summary

;;; Commentary:
;;  Key-combo settings

;;; Code:

(require-package 'key-combo)

(add-hook 'evil-normal-state-entry-hook (lambda () (key-combo-mode 0)))
(add-hook 'evil-insert-state-entry-hook (lambda () (key-combo-mode 1)))

(key-combo-define emacs-lisp-mode-map "=" '("= " "eq " "equal "))

(defvar my-key-combos-for-js
  '(("=" . ("=" " = " " === " " == "))
    ("|" . ("|" " || "))
    ("&" . ("&" " && "))))

(defvar my-js-mode-hooks '(js2-mode-hook js-mode-hook))

(key-combo-define-hook my-js-mode-hooks 'my-key-combo-js-hook my-key-combos-for-js)

(provide 'init-key-combo)

;;; init-key-combo.el ends here
