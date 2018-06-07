(load "package.lisp" :external-format :utf-8)

(in-package :cl-ltk-text-input)

(defun main ()
  (with-ltk ()
    (wm-title *tk* "Celsius <=> Fahrenheit")
    (bind *tk* "<Alt-q>" (lambda (event)
                           (declare (ignore event))
                           (setq *exit-mainloop* t)))
    (let* ((start-time 0)
           (main-frame (make-instance 'frame))
           ;; (btn0 (make-instance 'button :text "Timer Start!" :master main-frame))
           (label0 (make-instance 'label :text "Enter=>Translate!" :width 15 :master main-frame))
           (cel-frame (make-instance 'frame))
           (label1 (make-instance 'label :text "Celsius" :width 10 :master cel-frame))
           (entry1 (make-instance 'entry :master cel-frame :width 10))
           (far-frame (make-instance 'frame))
           (label2 (make-instance 'label :text "Fahrenheit" :width 10 :master far-frame))
           (entry2 (make-instance 'entry :master far-frame :width 10))
           (label3 (make-instance 'label :text "Result" :foreground 'black))
           ;;(label4 (make-instance 'label :text "Sequence Time" :foreground 'black))
           )
      ;; (setf (command btn0) (lambda () (setf start-time (get-current-mill))))
      (bind entry1 "<Return>" (lambda (event)
                                (declare (ignore event))
                                ;;(setf (text label4) (- (get-current-mill)
                                ;;start-time))
                                (setf (text label3)
                                      (+ 32
                                         (* 1.8
                                            (with-input-from-string (in (text entry1))
                                              (read in))))
                                      )))
      (bind entry2 "<Return>" (lambda (event)
                                (declare (ignore event))
                                ;; (setf (text label4) (- (get-current-mill)
                                ;;                        start-time))
                                (setf (text label3)
                                      (/ (+ (- 0 32)
                                            (with-input-from-string (in (text entry2))
                                              (read in)))
                                         1.8))))
      ;; (focus btn0)
      (set-geometry *tk* 300 150 200 200)
      (pack main-frame :pady 20)
      (pack label0)
      (pack (list label1 entry1) :side :left :padx 10)
      (pack (list label2 entry2) :side :left :padx 10)
      (pack (list cel-frame far-frame) :fill :x :padx 50)
      (pack label3 :pady 10))))
