;;; init-company-mode.el --- Summary

;;; Commentary:
;;; emacs configuration

;;; Code:

(require-package 'company)
(require-package 'ycmd)
(require-package 'company-ycmd)

(require 'ycmd)
(require 'company-ycmd)

(set-variable 'ycmd-server-command
              (list "python" (expand-file-name "ycmd/ycmd" user-emacs-directory)))

(company-ycmd-setup)

(add-to-list 'completion-styles 'initials t)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-ycmd-mode)

(provide 'init-company-mode)

;;; init-company-mode.el ends here
