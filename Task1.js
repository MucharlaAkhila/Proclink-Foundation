const cart = [
    { name: "Apple", price: 0.5, quantity: 4 },
    { name: "Banana", price: 0.25, quantity: 6 },
  ];
  
  const newItems = [
    { name: "Cherry", price: 0.75, quantity: 5 },
    { name: "Date", price: 1, quantity: 3 },
  ];
  
  //   Ex 1.1: Combine cart + newItems

  const newlist = [...cart,...newItems];
//   console.log(newlist);
  
  
//   // Ex 1.2: Find total of cart
//  var sum=0;
//   for (let i=0; i< newlist.length; i++) {
//     //console.log(newlist[i].price);
//    let product = newlist[i].price * newlist[i].quantity ;  
//      sum = sum + product;
// }
// console.log(sum);



let total = 0;
for(let {price, quantity} of newlist){
  total+= price * quantity
}
console.log(total);
  