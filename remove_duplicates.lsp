; ==================================================================
; удаление повторяющихся элементов в списке
; ==================================================================
; определение пользовательской функции my-remove-duplicates
(defun my-remove-duplicates (lst)
  ; условное предложение cond для выбора подходящего варианта
  (cond
    ; предикат null для проверки списка на наличие элементов
    ((null lst)
      ; возврат nil, если список является пустым
      nil)

    ; проверка хвостовой части списка на вхождение головного элемента
    ((member (car lst) (cdr lst) :test #'equal)
      ; рекурсивный вызов функции my-remove-duplicates при выполнении условия выше
      (my-remove-duplicates (cdr lst)))

    ; вычисление выражения, если ни одно из выше указанных условий не было выполнено
    (t
      ; Создание списка без повторяющихся элементов.
      ; В качестве аргументов передаются голова списка и новый список,
      ; полученный в результате рекурсивного вызова функции my-remove-duplicates.
      (cons (car lst) (my-remove-duplicates (cdr lst))))))

(print "Тестирование функции my-remove-duplicates: (my-remove-duplicates '(1 2 3 a 4 a (1) 4 (1) 6))")
(print (my-remove-duplicates '(1 2 3 a 4 a (1) 4 (1) 6)))	; (1 2 3 A 4 (1) 6)
