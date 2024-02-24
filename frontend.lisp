;;;; acylx-radiance.lisp

(in-package #:acylx-radiance)

(define-page index "acylx/index" (:clip "index.ctml")
  (r-clip:process T))
