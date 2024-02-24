;;;; acylx-radiance.asd

(asdf:defsystem #:acylx-radiance
  :description "Describe acylx-radiance here"
  :author "Iván Villagrasa <ivvil412@gmail.com>"
  :license  "GPL V3"
  :defsystem-depends-on (:radiance)
  :class "radiance:virtual-module"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "frontend")
			   (:lass-file "static/acylx.lass"))
  :depends-on (:r-clip
			   :lass))
