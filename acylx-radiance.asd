;;;; acylx-radiance.asd

(asdf:defsystem #:acylx-radiance
  :description "Describe acylx-radiance here"
  :author "Iván Villagrasa <ivvil412@gmail.com>"
  :license  "GPL V3"
  :defsystem-depends-on (:radiance
						 :lass)
  :class "radiance:virtual-module"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
			   (:file "genfont-declaration")
               (:file "frontend")
			   (:file "navbar")
			   ;; (:lass-file "static/acylx")
			   )
  :depends-on (:r-clip
			   :lass
			   :spinneret))
