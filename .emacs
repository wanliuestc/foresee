(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(require 'cl)
(defvar wanli/package '(company
;;			monokai-theme
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
(load-theme 'monokai t)

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(company-minimum-prefix-length 1)
 '(company-tooltip-idle-delay 0.1)
 '(compilation-message-face (quote default))
 '(custom-safe-themes (quote ("c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors (quote (("#3C3D37" . 0) ("#679A01" . 20) ("#4BBEAE" . 30) ("#1DB4D0" . 50) ("#9A8F21" . 60) ("#A75B00" . 70) ("#F309DF" . 85) ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#F92672") (40 . "#CF4F1F") (60 . "#C26C0F") (80 . "#E6DB74") (100 . "#AB8C00") (120 . "#A18F00") (140 . "#989200") (160 . "#8E9500") (180 . "#A6E22E") (200 . "#729A1E") (220 . "#609C3C") (240 . "#4E9D5B") (260 . "#3C9F79") (280 . "#A1EFE4") (300 . "#299BA6") (320 . "#2896B5") (340 . "#2790C3") (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
