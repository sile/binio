(defpackage binio
  (:use :common-lisp)
  (:shadow open)
  (:export
   ;; function
   open

   ;; type
   binio
   octet
   ))
(in-package :binio)

(deftype octet () '(unsigned-byte 8))
