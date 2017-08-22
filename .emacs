(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode t)

(require 'package)
;(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;                    (not (gnutls-available-p))))
;       (url (concat (if no-ssl "http" "http") "://melpa.org/packages/")))
;  (add-to-list 'package-archives (cons "melpa" url) t))
;(when (< emacs-major-version 24)
;  ;; For important compatibility libraries like cl-lib
;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

; Clock
(display-time)


(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)



;(set-default 'cursor-type
;	     'hbar)

(column-number-mode)
(show-paren-mode)
(electric-pair-mode)
(global-hl-line-mode t)

(winner-mode t)
(windmove-default-keybindings)
(load-theme 'wombat)


