
%%Facts

%Initial Founders
is_founder(okp411).
is_founder(okp412).
is_founder(okp413).
is_founder(okp414).
is_founder(okp415).

%Categories
category(data).
category(software).
category(law).
category(finance).
category(education).

%Titles
title(analyst).
title(developer).
title(lawyer).
title(economist).
title(teacher).

is_satisfactory(X, Y) :- X>19, title(Y).

%-----------------
title(member).

%Voting Powers
can_vote_on(analyst, data).
can_vote_on(developer, software).
can_vote_on(lawyer, law).
can_vote_on(economist, finance).
can_vote_on(teacher, education).


are_active(X, [A, B, C, D, E], Z, Y) :- is_founder(X), 
is_satisfactory(A, teacher),
is_satisfactory(B, lawyer),
is_satisfactory(C, economist),
is_satisfactory(D, developer),
is_satisfactory(E, analyst) 
| dean_privilege(Y), Z > 99.

%Can create title
%X is going to be an address always
%Y is going to be a title (ex. analyst)
%Z is total number of members with that title
%A is total number of experts
can_create_title(X, [A,B,C,D,E], Y, Z, A, F) :- are_active(X, [A,B,C,D,E] , Z, F), title(Y).





%Derivative Facts
can_add_founder(X) :- is_founder(X).

dean_privilege(dean).

%
can_join_freely([
    TeacherAmount, 
    LawyerAmount, 
    EconomistAmount, 
    DeveloperAmount, 
    AnalystAmount]) :- 
is_satisfactory(TeacherAmount, teacher),
is_satisfactory(LawyerAmount, lawyer),
is_satisfactory(EconomistAmount, economist),
is_satisfactory(DeveloperAmount, developer),
is_satisfactory(AnalystAmount, analyst).

% With this voting system, the Smart Contracts
% Can use our subsytem to check if their current voting calculation
% satisfies the output.
% With satisfied outputs using our system, calculating the voting power
% of a user in a DAO can be done without smart contract modification.
% This also can be used for fast verification of any kind of calculation.
is_correct_amount_vote(Title, Input, Function) :- 
    title(Title), 
    Function =:= Input.

% voting rights

bank_balances_has_sufficient_coin(Addr, Limit, Unit) :- bank_balances(Addr, [Unit-Nb]), compare(>, Nb, Limit).

is_citizen(Addr, Limit, Unit) :- bank_balances_has_sufficient_coin(Addr, Limit, Unit). 
