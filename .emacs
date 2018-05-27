(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(require 'cl)
(defvar wanli/package '(company
			hungry-delete
			company-c-headers
			swiper
			counsel
			smartparens 
				) "Default packages")

(defun wanli/packages-installed-p()
  (loop for pkg in wanli/package
	when(not (package-installed-p pkg)) do (return nil)
	finally (return t)))
	
(unless (wanli/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg wanli/package)
    (when (not (package-installed-p pkg)) 
      (package-install pkg))))


(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)

(require 'hungry-delete)
(global-hungry-delete-mode t)

(require 'company-c-headers)
(add-to-list 'company-backends 'company-c-headers)

(setq inhibit-startup-screen t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs"))

(global-set-key (kbd "<f3>") 'open-my-init-file)

(global-company-mode t)

(setq-default cursor-type 'bar)
(setq make-backup-files nil)

(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)



(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(global-hl-line-mode 0)
