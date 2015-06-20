;;; Character sets

(defcustom sanityinc/force-default-font-for-symbols nil
  "When non-nil, force Emacs to use your default font for symbols."
  :type 'boolean)

(defun sanityinc/maybe-use-default-font-for-symbols ()
  "Force Emacs to render symbols using the default font, if so configured."
  (when sanityinc/force-default-font-for-symbols
    (set-fontset-font "fontset-default" 'symbol (face-attribute 'default :family))))

(add-to-list 'default-frame-alist '(font . "MonacoB2 for Powerline"))
(set-face-attribute 'default nil :font "MonacoB2 for Powerline")
(set-frame-font "MonacoB2 for Powerline" nil t)

(add-hook 'after-init-hook 'sanityinc/maybe-use-default-font-for-symbols)

(provide 'init-fonts)
