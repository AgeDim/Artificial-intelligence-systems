spouse("Michail Romanov", "Evdokia Streshneva").
spouse("Alexsey Romanov", "Maria Miloslavskaya").
spouse("Alexsey Romanov", "Natalya Naryshkina").
spouse("Feodor Romanov", "Marfa Apraksina").
spouse("Ioann V Romanov", "Praskof'ya Saltikova").
spouse("Karl Leopold", "Ekaterina Ioannovna").
spouse("Anton Ulrih", "Anna Leopoldovna").
spouse("Petr I Romanov", "Evdokia Lopouhina").
spouse("Alexsey Petrovich", "Natalya Braunshveyg").
spouse("Petr I Romanov", "Ekaterina I Alekseevna").
spouse("Karl Fridrih Golfshtein", "Anna Petrovna").
spouse("Ekaterina II Alexseevna", "Petr III Fedorovich").

parent("Michail Romanov", "Alexsey Romanov").
parent("Evdokia Streshneva", "Alexsey Romanov").
parent("Alexsey Romanov", "Feodor Romanov").
parent("Alexsey Romanov", "Sofya Romanova").
parent("Alexsey Romanov", "Ioann V Romanov").
parent("Maria Miloslavskaya", "Feodor Romanov").
parent("Maria Miloslavskaya", "Sofya Romanova").
parent("Maria Miloslavskaya", "Ioann V Romanov").
parent("Ioann V Romanov", "Anna Ioannovna").
parent("Ioann V Romanov", "Ekaterina Ioannovna").
parent("Praskofya Saltikova", "Anna Ioannovna").
parent("Praskofya Saltikova", "Ekaterina Ioannovna").
parent("Karl Leopold", "Anna Leopoldovna").
parent("Ekaterina Ioannovna", "Anna Leopoldovna").
parent("Anton Ulrih", "Ioann VI Romanov").
parent("Anna Leopoldovna", "Ioann VI Romanov").
parent("Alexsey Romanov", "Petr I Romanov").
parent("Natalya Naryshkina", "Petr I Romanov").
parent("Petr I Romanov", "Alexsey Petrovich").
parent("Evdokia Lopouhina", "Alexsey Petrovich").
parent("Alexsey Petrovich", "Petr II Alexseevich").
parent("Natalya Braunshveyg", "Petr II Alexseevich").
parent("Petr I Romanov", "Anna Petrovna").
parent("Ekaterina I Alexseevna", "Anna Petrovna").
parent("Petr I Romanov", "Elizaveta Petrovna").
parent("Ekaterina I Alexseevna", "Elizaveta Petrovna").
parent("Karl Fridrih Golfshtein", "Petr III Fedorovich").
parent("Anna Petrovna", "Petr III Fedorovich").

male("Michail Romanov").
male("Alexsey Romanov").
male("Feodor Romanov").
male("Ioann V Romanov").
male("Ioann VI Romanov").
male("Karl Leopold").
male("Anton Ulrih").
male("Petr I Romanov").
male("Alexsey Petrovich").
male("Petr II Alekseevich").
male("Karl Fridrih Golfshtein").
male("Petr III Fedorovich").

female("Evdokia Streshneva").
female("Natalya Naryshkina").
female("Maria Miloslavskaya").
female("Sofya Romanova").
female("Marfa Apraksina").
female("Praskofya Saltikova").
female("Anna Ioannovna").
female("Ekaterina Ioannovna").
female("Anna Leopol'dovna").
female("Evdokia Lopouhina").
female("Natalya Braunshveyg").
female("Ekaterina I Alexseevna").
female("Anna Petrovna").
female("Elizaveta Petrovna").
female("Ekaterina II Alexseevna").

son(A, B):- parent(B, A), male(A).
daughter(A, B)          :- parent(B, A), female(A).

father(A, B)            :- parent(A, B), male(A).
mother(A, B)            :- parent(A, B), female(A).

grandfather(A, C)       :- father(A, B), father(B, C); father(A, B), mother(B, C).
grandmother(A, C)       :- mother(A, B), father(B, C); mother(A, B), mother(B, C).

brother_or_sister(A, B) :- parent(C, A), parent(C, B), A \= B.

brother(A, B)           :- brother_or_sister(A, B), male(A).
sister(A, B)            :- brother_or_sister(A, B), female(A).

uncle(A, B)				:- parent(C, B), brother(A, C).