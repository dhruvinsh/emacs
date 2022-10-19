;;; early-init.el --- Early Init File -*- lexical-binding: t -*-

;;; Code:

(setq frame-resize-pixelwise t)

;; Do not resize the frame at early stage
(setq frame-inhibit-implied-resize t)

;; Initialise installed packages
(setq package-enable-at-startup t)

(defvar package-quickstart)

;; Allow loading from the package cache
(setq package-quickstart t)

;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inihibit-splash-screen t)
(setq use-dialog-box t)
(setq use-file-dialog nil)

(setq inhibit-startup-echo-area-message user-login-name)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)

(setq native-comp-async-report-warning-error 'silent)

;;; early-init.el ends here

