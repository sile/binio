(in-package :binio)

(defstruct binio
  (stream t :type stream :read-only t))

(defmacro funtype (name arg-types return-type)
  `(declaim (ftype (function ,arg-types ,return-type) ,name)))

(funtype open ((or pathname string) &key
               (:direction (member :input :output :io :probe))
               (:if-exists (member :error :new-version :rename :rename-and-delete :overwrite :append :supersede nil))
               (:if-does-not-exist (member :error :create nil)))
         (or binio null))
(defun open (filespec &key (direction :input) (if-exists nil #1=if-exists-given) (if-does-not-exist nil #2=if-does-not-exist-given))
  (macrolet ((%open (&rest rest-args)
               `(common-lisp:open filespec :element-type 'octet :direction direction ,@rest-args)))
    (let ((stream
           (cond ((and #1# #2#) (%open :if-exists if-exists :if-does-not-exist if-does-not-exist))
                 ((and #1#)     (%open :if-exists if-exists))
                 ((and #2#)     (%open :if-does-not-exist if-does-not-exist))
                 ((and)         (%open)))))
      (when stream
        (make-binio :stream stream)))))
