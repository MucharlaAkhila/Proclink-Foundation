var q1=[100,200];
var q2= [...q1];//spread operator (copy by value)
var q3 =[60,...q1,90,40];
console. log(q3);

var t1=[400, 500];
var t2= [90,80];
var t3=[...t2,...t1];
console.log(t3);