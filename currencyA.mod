set agents;
set currencies;

var transferred{i in agents, j in agents, k in currencies}, >=0;

param owed{i in agents, c in currencies};
param meetings{i in agents, j in agents};


minimize volume_transferred: sum{i in agents, j in agents, c in currencies} transferred[i,j,c];


s.t. complementary_slackness{i in agents,j in agents,k in currencies}: transferred[i,j,k] - meetings[i,j]*transferred[i,j,k]=0;
s.t. balanced{k in currencies, i in agents}: (sum{j in agents} transferred[j,i,k])-(sum{j in agents} transferred[i,j,k]) - owed[i,k]=0;



data;

set agents := Alice Bob Eva Jack Rose Tom;
set currencies := dollar euro yen;

param owed:
      dollar euro yen :=
Alice      3    2 -15
Bob       -6  -10  -5
Eva        5    5  10
Jack       1   -3  -2
Rose      -1    3   2
Tom       -2    3  10;


param meetings:
      Alice Bob Eva Jack  Rose Tom :=
Alice     0   1   0    0     0   1
Bob       1   0   1    0     0   1
Eva       0   1   0    1     1   1
Jack      0   0   1    0     1   0
Rose      0   0   1    1     0   0
Tom       1   1   1    0     0   0;



end;
