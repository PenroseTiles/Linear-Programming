/*bids 1 through n, outcomes 1 through m */


param m;
param n;
param payout{i in 1..m, j in 1..n};
param bid{j in 1..n};
var wcl;
var x{j in 1..n}, binary;

maximize worst_case_loss: wcl;
s.t. every_state{i in 1..m}: sum{j in 1..n} (bid[j]-payout[i,j])*x[j] >= wcl;

data;

param m:=4;
param n:=5;
param payout : 1 2 3 4 5 :=
           1   0 0 9 6 0
           2   0 2 9 0 0
 	   3  11 0 0 0 0
	   4   0 8 0 6 10;
param bid:= 1 3 2 4 3 5 4 3 5 1;
end;
