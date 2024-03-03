(in-package #:acylx-radiance)

;; TODO: Make font filepaths relative

(defun add-font (path name)
  `(:font-face :font-family ,(substitute #\- #\Space name) :src (url ,path)))

(defun get-fonts (path) "Gets all font declarations for a given folder"
  (flet ((cut-string-at-dot (input-string) (if (position #\. input-string)
											   (subseq input-string 0 (position #\. input-string))
											   input-string)))
		 (loop for file in (uiop:directory-files path) collect (let ((name (cut-string-at-dot (file-namestring file)))) (add-font (concatenate 'string "../acylx-radiance/assets/fonts/" (file-namestring file)) name)))))
