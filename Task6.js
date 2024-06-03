let sentence = "Hello world from JavaScript";
let uc = sentence.toUpperCase();
let a= uc.split(" ");
let b= a.reverse();
let transformed = b.join(" ");
console.log(transformed); // Output: "JAVASCRIPT FROM WORLD HELLO"