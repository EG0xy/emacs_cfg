(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode t)
(column-number-mode)
(show-paren-mode)
(electric-pair-mode)
(global-hl-line-mode t)
(winner-mode t)
(windmove-default-keybindings)

					; Startup windowing
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

					; Turn off the bell on Mac OS X
(defun nil-bell ())
(setq ring-bell-function 'nil-bell)
(define-key global-map(kbd "C-c ;") 'iedit-mode)
					; No screwing with my middle mouse button
(global-unset-key [mouse-2])

;(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;                    (not (gnutls-available-p))))
;       (url (concat (if no-ssl "http" "http") "://melpa.org/packages/")))
;  (add-to-list 'package-archives (cons "melpa" url) t))
;(when (< emacs-major-version 24)
;  ;; For important compatibility libraries like cl-lib
;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

;; (defun my:ac-c-header-init()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers))



;; ;;  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include"))
;;                     ;now let's call this function from c/c++ hooks
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

;; ;; irony-mode

;;     (add-hook 'c++-mode-hook 'irony-mode)
;;     (add-hook 'c-mode-hook 'irony-mode)
;;     (add-hook 'objc-mode-hook 'irony-mode)

;;     ;; replace the `completion-at-point' and `complete-symbol' bindings in
;;     ;; irony-mode's buffers by irony-mode's asynchronous function
;;     (defun my-irony-mode-hook ()
;;       (define-key irony-mode-map [remap completion-at-point]
;;         'irony-completion-at-point-async)
;;       (define-key irony-mode-map [remap complete-symbol]
;;         'irony-completion-at-point-async))
;;     (add-hook 'irony-mode-hook 'my-irony-mode-hook)

;; ;; company-irony

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))
;; (global-set-key (kbd "M-RET") 'company-complete)


					;autocompletion C/C++
(add-hook 'after-init-hook 'global-company-mode)




;;== irony-mode ==
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;;== company-mode ==
(require 'company)
(add-hook 'after-init-hook 'global-company-mode) 
  (setq company-idle-delay              nil
	company-minimum-prefix-length   2
	company-show-numbers            t
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
	company-backends                '((company-irony company-gtags))
	)
(global-set-key (kbd "TAB") 'company-complete-common)



					; Clock
(display-time)

					;Key binding functions
(defun previous-blank-line ()
  "Moves to the previous line containing nothing but whitespace."
  (interactive)
  (previous-line 15)
  ;(search-backward-regexp "^[ \t]*\n")
)
(defun next-blank-line ()
  "Moves to the next line containing nothing but whitespace."
  (interactive)
  (forward-line 15)
  ;(search-forward-regexp "^[ \t]*\n")
  ;(forward-line -1)
)
					; Key bindings

(global-set-key (kbd "C-/") 'comment-dwim)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-TAB") 'indent-for-tab-command)

(define-key global-map [C-right] 'forward-word)
(define-key global-map [C-left] 'backward-word)
(define-key global-map [C-up] 'previous-blank-line)
(define-key global-map [C-down] 'next-blank-line)
(define-key global-map [pgup] 'forward-page)
(define-key global-map [pgdown] 'backward-page)
(define-key global-map [f9] 'first-error)
(define-key global-map [f10] 'previus-error)
(define-key global-map [f11] 'next-error)

(define-key global-map(kbd "C-;") 'iedit-mode)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defun never-split-a-window
    "Never, ever split a window.  Why would anyone EVER want you to do that??"
    nil)
(setq split-window-preferred-function 'never-split-a-window)

;(set-default 'cursor-type
;	     'hbar)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(package-selected-packages (quote (smex))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


