% =================================================================================
% пересечение списков
% =================================================================================
% пересечением пустых списков является пустой список;
% конструкция отсечения для предотвращения дальнейшего перебора
p([], _, []) :- !.

% предикат p добавляет элемент H в результирующий список Z
p([H|X], Y, [H|Z]) :-
	% пытаемся найти и удалить элемент H из списка Y
	remove_element(H, Y, Y_, F),

	% случай, когда предыдущее условие было выполнено:
	% то есть, искомый элемент был удален из списка
	F = 1,

	% использование рекурсии для нахождения пересечения
	% хвоста исходного списка и обновленного списка Y
	p(X, Y_, Z), !.

% случай, когда предикат p не добавляет элемент H в результирующий список Z
p([H|X], Y, Z) :-
	% пытаемся найти и удалить элемент H из списка Y
	remove_element(H, Y, _, F),

	% случай, когда предыдущее условие не было выполнено:
	% то есть, искомый элемент в списке не был найден
	F = 0,

	% использование рекурсии для нахождения пересечения
	% хвоста исходного списка и списка Y
	p(X, Y, Z), !.

% Если список, из котого необходимо удалить элемент,
% является пустым, то результирующий список также будет пустым.
% 0 означает отсутствие искомого элемента в списке.
remove_element(_, [], [], 0) :- !.

% Пересечением списка X и списка [X|Т] с X в качестве головы,
% является список Т.
% 1 означает присутствие искомого элемента в списке.
remove_element(X, [X|T], T, 1) :- !.

% Предикат для случая, когда X не является головой списка [Y|T]
% и в качестве результирующего списка выступает [Y|T_].
% F - обозначает наличие или отсутствие искомого элемента в списке.
remove_element(X, [Y|T], [Y|T_], F) :-
	% рекурсивный вызов предиката remove_element
	% для удаления элемента из оставшейся части списка
	remove_element(X, T, T_, F).

% ?- p([1,2,3,4,4,5,5,5,5,6], [4,5,5,6,7], Z). 	% [4,5,5,6]
% ?- p([1,2,2,2,3], [1,2,2,4], Z). 				% [1,2,2]
