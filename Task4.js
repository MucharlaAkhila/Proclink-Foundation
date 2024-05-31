// Ex4: Top 1 movie titles

const movies = [
    { title: "Inception", ratings: [5, 4, 5, 4, 5] },
    { title: "Interstellar", ratings: [5, 5, 4, 5, 4] },
    { title: "Dunkirk", ratings: [4, 4, 4, 3, 4] },
    { title: "The Dark Knight", ratings: [5, 5, 5, 5, 5] },
    { title: "Memento", ratings: [4, 5, 4, 5, 4] },
  ];
  
  // Expected Output:  The Dark Knight and Inception

  let a =[];
  for(var i=0;i<movies.length;i++){
    sum =0;
    for(var j=0;j<movies[i].ratings.length;j++){
    sum+=movies[i].ratings[j];
    }
    var avg = sum/5;var list = {title: movies[i].title, avg: sum/5};
    a.push(list);
  }
//console.log(a);
var max1= 0;
  var max2=0;
for(var k=0; k<a.length;k++){
  if (a[k].avg > max1){
    max2 = max1;
    max1 = a[k].avg;
  }  
}
var c=[];
for(var b=0; b<a.length;b++){
  if(a[b].avg>max2){
    c.push(a[b].title);

  }
}
console.log(c);
