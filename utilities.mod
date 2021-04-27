set events;
set relations;

var utilities{i in events}, >=0,<=1;
#var epsilons{i in relations}, >=0;
var epsilon;
param coefficients_lhs{j in relations, i in events};
param coefficients_rhs{j in relations, i in events};

#maximize slack: sum{i in relations} epsilons[i];
maximize slack: epsilon;

s.t. satisfy_inequalities{j in relations}: (sum{i in events} coefficients_lhs[j,i]*utilities[i]) >= (sum{i in events} coefficients_rhs[j,i]*utilities[i]) + epsilon;

data;

set events := A B C D;
set relations := A1 A2 A3 A4;

param coefficients_lhs:
     A      B      C      D :=
A1   0.1    0.2    0.3    0.4
A2   0.4    0.4    0.1    0.1
A3   0.6    0.1    0.0    0.3
A4   0.4    0.3    0.2    0.1;

param coefficients_rhs:
     A      B      C      D :=
A1   0.1    0.2    0.4    0.3
A2   0.4    0.2    0.2    0.2
A3   0.4    0.3    0.3    0.0
A4   0.5    0.5    0.0    0.0;
    
end;
