;;; init.el --- Summary

;;; Commentary:
;;; emacs configuration

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-benchmarking)

(defconst *spell-check-support-enabled* nil)
(defconst *is-a-mac* (eq system-type 'darwin))

(setq custom-file (expand-file-name "custom.el" ))
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)
(require 'init-exec-path)

(require 'init-preload-local nil t)

(require-package 'diminish)
(require-package 'mwe-log-commands)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-gui-frames)
(require 'init-proxies)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-windows)
;(require 'init-sessions)   ; contains an definition that causes a safe def prompt
(require 'init-fonts)
(require 'init-mmm)
(require 'init-editing-utils)

(require 'init-vc)
(require 'init-git)
(require 'init-github)

(require 'init-compile)
(require 'init-crontab)
(require 'init-markdown)
(require 'init-csv)
(require 'init-javascript)
(require 'init-org)
(require 'init-nxml)
(require 'init-html)
(require 'init-css)
(require 'init-haml)
(require 'init-python-mode)
(require 'init-haskell)
(require 'init-ruby-mode)
(require 'init-rails)
(require 'init-sql)

(require 'init-paredit)
(require 'init-lisp)
(require 'init-slime)
(require 'init-common-lisp)

(require 'init-key-combo)

(require 'init-setup-helm)



(when *spell-check-support-enabled*
  (require 'init-spelling))

                                        ; (require 'init-misc)
                                        ; (require 'init-dash)

                                        ; (when *is-a-mac* (require-package 'osx-location))
                                        ; (require-package 'regex-tool)

                                        ; (require 'server)
                                        ; (unless (server-running-p) (server-start))

(require 'init-evil)

(add-hook 'after-init-hook
          (lambda () (message
                 "init completed in %.2fms"
                 (sanityinc/time-subtract-millis after-init-time before-init-time))))

(provide 'init)

;;; init.el ends here
