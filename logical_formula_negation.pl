% =================================================================================
% отрицание логических формул
% =================================================================================
% исходные операторы
:- op(100, fy, ~).
:- op(110, xfy, &).
:- op(120, xfy, v).

% правила преобразования для логических литералов
not(true, true).
not(false, false).
not(~true, false).
not(~false, true).

% отрицание отрицания
not(~(~X), Y) :-
	not(X, Y).

% правило для конъюнкции без оператора отрицания
not(X & Y, X1 & Y1) :-
	not(X, X1),
	not(Y, Y1).

% правило для дизъюнкции без оператора отрицания
not(X v Y, X1 v Y1) :-
	not(X, X1),
	not(Y, Y1).

% по правилу де Моргана: отрицание конъюнкции есть дизъюнкция отрицаний.
not(~(X & Y), X1 v Y1):-
	not(~X, X1),
	not(~Y, Y1).

% по правилу де Моргана: отрицание дизъюнкции есть конъюнкция отрицаний.
not(~(X v Y), X1 & Y1) :-
	not(~X, X1),
	not(~Y, Y1).

% ?- not(~(~true v false) v ~(true & ~false), X). % (true & true) v (false v false)