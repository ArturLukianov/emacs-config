; Emacs config

;; Think I should reorganize it a bit, looks really messy

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("e26e879d250140e0d4c4d5ab457c32bcb29742599bd28c1ce31301344c6f2a11" "72c530c9c8f3561b5ab3bf5cda948cd917de23f48d9825b7a781fe1c0d737f2f" "d8a7a7d2cffbc55ec5efbeb5d14a5477f588ee18c5cddd7560918f9674032727" "53de65a1e7300e0f1a4f8bf317530a5008e9d06a0e2f8863b80dc56d77f844cf" "2047464bf6781156ebdac9e38a17b97bd2594b39cfeaab561afffcbbe19314e2" "ed92c27d2d086496b232617213a4e4a28110bdc0730a9457edf74f81b782c5cf" "6b2c6e5bc1e89cf7d927d17f436626eac98a04fdab89e080f4e193f6d291c93d" default)))
 '(fci-rule-color "#383838")
 '(inhibit-startup-screen t)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/notes/mordor.org")))
 '(package-check-signature nil)
 '(package-selected-packages
   (quote
    (auctex color-theme-modern spaceline zenburn-theme htmlize go-mode csharp-mode php-mode multiple-cursors magit helm markdown-mode auto-complete smartparens slime)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Some prettines
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Disable GUI components
(tooltip-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

;; Linum plugin
(require 'linum)
(line-number-mode t)
(global-linum-mode t)
(column-number-mode t)
(setq linum-format " %d")

;; Shorten messages in minibuffer
(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable some disabled commadns
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)

;; Bindings to fasten typing
(global-set-key (kbd "M-o") 'other-window)


;; Ido configuration
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-separator "\n")

;; Expansion and completion
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; Edit file as superuser
(defun sudo ()
  "Use TRAMP to `sudo` current buffer"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@proventus:"
	     buffer-file-name))))

;; Git configuration
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Dired subtree
;(define-key dired-mode-map "i" 'dired-subtree-insert)
;(define-key dired-mode-map ";" 'dired-subtree-remove)

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; Org mode
(require 'org-mode)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)


;; Themes
(require 'spaceline-config)
(spaceline-emacs-theme)

