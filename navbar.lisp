;;;; navbar.lisp

(defparameter *navbar-groups* '())


(defclass navbar-group ()
  ((name
	:initarg :name
	:accessor name
	:documentation "Name of the group")
   (links
	:initform '()
	:accessor links
	:documentation "List of the displayed links"))
  (:documentation "A named navbar group"))

(defclass link ()
  ((name
	:initarg :name
	:accessor name
	:documentation "Visible name of the link")
   (link
	:initarg :link
	:accessor link
	:documentation "Where the links"))
  (:documentation "Models a link with a visible name"))


(defgeneric render (renderable)
  (:documentation "Renders object to html"))

(defmethod render ((renderable link))
  (make-link (name renderable) (link renderable)))

(defmethod render ((renderable navbar-group))
  (let ((links (mapcar 'render (links renderable))))
	`(:div
	  :class "container"
	  (:b ,(name renderable))
	  (:div
	   :class "content"
	   ,links))))


(defun make-link (name link)
  `(:a
	:href ,link
	,name))
