// Task 5
const movieUrl = (domain, genre, year) =>`http://${domain}?genere=${genre}&year=${year}`;
console.log(movieUrl("imdb.com", "thriller", 2020));

