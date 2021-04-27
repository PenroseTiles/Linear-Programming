set SKILLS;
set STUDENTS;
set TEACHERS;

param k;
param wants_to_learn{c in SKILLS, s in STUDENTS};
param wants_to_teach{c in SKILLS, t in TEACHERS};
param valuation_s{s in STUDENTS};
param valuation_t{t in TEACHERS};

var courses_taught{c in SKILLS}, binary;
var student_bid_accepted{s in STUDENTS}, binary;
var teacher_bid_accepted{t in TEACHERS}, binary;

maximize value: sum{s in STUDENTS} (student_bid_accepted[s]*valuation_s[s]) + sum{t in TEACHERS}(teacher_bid_accepted[t]*valuation_t[t]);
s.t. k_bound: sum{c in SKILLS} courses_taught[c] <= k;
s.t. TBA_upper{c in SKILLS}: sum{t in TEACHERS}(wants_to_teach[c,t]*teacher_bid_accepted[t]) <= courses_taught[c];
s.t. TBA_lower{c in SKILLS}: sum{t in TEACHERS}(wants_to_teach[c,t]*teacher_bid_accepted[t]) >= courses_taught[c];
s.t. student_bids{c in SKILLS, s in STUDENTS}: student_bid_accepted[s]*wants_to_learn[c,s] <= courses_taught[c];

data;

set SKILLS := A B C;
set STUDENTS := s1 s2 s3;
set TEACHERS := t4 t5 t6;

param k := 2;
param wants_to_learn: s1 s2 s3 :=
	A 1 0 1
	B 1 1 0
	C 0 1 0;
param wants_to_teach: t4 t5 t6 :=
	A 1 0 0
	B 0 1 0
	C 0 0 1;
param valuation_s := s1 7 s2 8 s3 4;
param valuation_t := t4 -5 t5 -1 t6 -3;
end;
