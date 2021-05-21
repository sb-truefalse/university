(defun menu-add()
  (with-ltk ()
    (let* ((f (make-instance 'frame))
      (b_vvod_0 (make-instance 'entry
                               :master f
                               :text "Имя фрейма" ))
      (b_vvod_1 (make-instance 'entry
                               :master f
                               :text "Отец фрейма" ))
      ;INFO
      (b_vvod_2 (make-instance 'entry
                               :master f
                               :text "Название дисциплины" ))
      (b_vvod_3 (make-instance 'entry
                               :master f
                               :text "Форма обучения" ))
      (b_vvod_4 (make-instance 'entry
                               :master f
                               :text "План набора" ))
      (b_vvod_5 (make-instance 'entry
                               :master f
                               :text "Кафедра" ))
      (b_vvod_6 (make-instance 'entry
                               :master f
                               :text "Вид контроля" )) 
      (b_vvod_7 (make-instance 'entry
                               :master f
                               :text "Часы" ))
      (b_add (make-instance 'button
                            :master f
                            :text "Добавить дисциплину"
                            :command (lambda () (add_frm 'dist (intern (string-upcase (text b_vvod_0))) (intern (string-upcase (text b_vvod_1)))
                            (pairlis '(name form year pulpit control hours) (list (text b_vvod_2) (text b_vvod_3) 
                                                                                         (text b_vvod_4) (text b_vvod_5) 
                                                                                         (text b_vvod_6) (text b_vvod_7)
       )))))))
      (wm-title *tk* "Добавление фрейма")
      (pack f)
      (pack b_vvod_0)
      (pack b_vvod_1)
      (pack b_vvod_2)
      (pack b_vvod_3)
      (pack b_vvod_4)
      (pack b_vvod_5)
      (pack b_vvod_6)
      (pack b_vvod_7)
      (pack b_add)
      (configure f :borderwidth 3)
      (configure f :relief :sunken)
    )
  )
)

(defun menu-1()
  (with-ltk ()
    (let* ((f (make-instance 'frame))
          (b_show_text (make-instance 'label
                             :master f
                             :text show_text
                             ))
          (b_add (make-instance 'button
                             :master f
                             :text "Добавить дисциплину"
                             :command (lambda ()  (setf (text b_show_text) "Дисциплина добавлена") (menu-add) ) ))
          
          (b_vvod_1 (make-instance 'entry
                             :master f
                             :text "Введите параметр" ))
          (b_vvod_2 (make-instance 'entry
                             :master f
                             :text "Введите значение" ))

          (b_show (make-instance 'button
                             :master f
                             :text "Поиск дисциплины"
                             :command (lambda () (do-msg (format nil "Результат поиска: ~A~%" 
                             	(search_fr 'dist
                                            (intern (string-upcase (text b_vvod_1)))
                             				(text b_vvod_2))) )
                                            (setf (text b_show_text) "Поиск завершен") (setq result nil) )))
        
          (b_strct (make-instance 'button
                             :master f
                             :text "Просмотр структуры"
                             :command (lambda () (do-msg (print (show_str_fr 'dist 0))) (setf (text b_show_text) "Структура выведена")  (setq reso "") )))
          (b_exit (make-instance 'button
                             :master f
                             :text "Выйти"
                             :command (lambda () (setf *exit-mainloop* t) ))))

	  (wm-title *tk* "Дисциплины")
      (pack f)
      (pack b_show_text)
      (pack b_vvod_1)
      (pack b_vvod_2)
      (pack b_show)
      (pack b_add)
      (pack b_strct)
      (pack b_exit)
      (configure f :borderwidth 3)
      (configure f :relief :sunken)
      (loop for i from 1 to 50 do
        (terpri)
      )
    )
  )
)

(menu-1)