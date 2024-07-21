;;;; acylx-radiance.lisp

(in-package #:acylx-radiance)

(defvar *font-dir* #P"static/assets/fonts/")

(with-open-file (stream "static/fonts.css"
						:direction :output
						:if-exists :supersede
						:if-does-not-exist :create)
  (format stream (apply 'lass:compile-and-write (get-fonts *font-dir*))))

(defun static-uri (global-path)
  (let ((path (namestring global-path)))
	(concatenate 'string "static/acylx-radiance/" (subseq path (+ (search "static/" path)
					(length "static/"))))))

(define-page index "acylx/" (:clip "index.ctml")
  (r-clip:process T))

(define-page web-fonts ("acylx/wf/(.+)" 1001) (:uri-groups (path))
  (setf (header "Cache-Control") "public, max-age=31536000")
  (setf (header "Access-Control-Allow-Origin") (string-right-trim "/" (uri-to-url "acylx/" :representation :external)))
  (serve-file (@static (format NIL "assets/fonts/~a" path))))
