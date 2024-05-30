// Ex4: Top 2 movie titles

const movies = [
    { title: "Inception", ratings: [5, 4, 5, 4, 5] },
    { title: "Interstellar", ratings: [5, 5, 4, 5, 4] },
    { title: "Dunkirk", ratings: [4, 4, 4, 3, 4] },
    { title: "The Dark Knight", ratings: [5, 5, 5, 5, 5] },
    { title: "Memento", ratings: [4, 5, 4, 5, 4] },
  ];
  
  // Expected Output:  The Dark Knight and Inception


  for(var i=0;i<movies.length;i++){
    sum =0;
    for(var j=0;j<movies[i].ratings.length;j++){
    sum+=movies[i].ratings[j];
    
    }console.log(sum);


  }