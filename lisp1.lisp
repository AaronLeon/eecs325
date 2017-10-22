(in-package :cs325-user)

(defun has-number-p (s-exp)
  (cond ((atom s-exp) (numberp s-exp))
        (t (some #'has-number-p s-exp)))))