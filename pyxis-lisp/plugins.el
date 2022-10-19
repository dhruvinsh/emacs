;;; plugins.el --- Core plugin files -*- lexical-binding: t -*-
;;; Comment:
;;
;; Initialize package sources
;;
;;; Code:

(require 'package)

;; some config for package
(setq package-name-column-width 40)
(setq package-version-column-width 14)
(setq package-status-column-width 12)
(setq package-archive-column-width 8)
(add-hook 'package-menu-mode-hook #'hl-line-mode)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("org" . "https://orgmode.org/elpa/")
	("elpa" . "https://elpa.gnu.org/packages/")))

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; I am going to rely on use-package only.
(require 'use-package)
(setq use-package-always-ensure t)

;; Install all the packages that I need
;; UI
(use-package autothemer
  :ensure t)
(use-package catppuccin-theme)

;; Completion Style
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Vertical completion UI
(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-count 20)
  (setq vertico-resize t)
  (setq vertico-cycle t))

;; Supercharge M-x with annotations
(use-package marginalia
  :bind (("M-A" . marginalia-cycle)
	 :map minibuffer-local-map
	 ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; Supercharge completion at point
(use-package corfu
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  :init
  (global-corfu-mode))

;; key bindings
(use-package which-key
  :init
  (which-key-mode))

;; Supercharge Git
(use-package magit)

(provide 'plugins)
