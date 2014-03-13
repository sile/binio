(in-package :asdf)

(defsystem binio
  :name "binio"
  :author "Takeru Ohta"
  :description "Binary I/O Library"
  :version "0.0.1"
  :serial t
  :components ((:file "src/package")
               (:file "src/binio")))


