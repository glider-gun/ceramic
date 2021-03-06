(in-package :cl-user)
(defpackage ceramic.setup
  (:use :cl)
  (:import-from :ceramic.util
                :tell)
  (:import-from :ceramic.file
                :*ceramic-directory*
                :*buildapp-pathname*)
  (:import-from :ceramic.os
                :*operating-system*
                :*architecture*)
  (:export :setup)
  (:documentation "Set everything up for Ceramic."))
(in-package :ceramic.setup)

(defun install-buildapp ()
  "Install a local copy of Buildapp."
  (tell "Installing Buildapp...")
  (if (probe-file *buildapp-pathname*)
      (tell "Already installed")
      (buildapp:build-buildapp (namestring *buildapp-pathname*))))

(defun setup ()
  (tell "Creating Ceramic directories...")
  (ensure-directories-exist *ceramic-directory*)
  (install-buildapp)
  (tell "Downloading a copy of Electron...")
  (ceramic.electron:setup))
