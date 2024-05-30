// Ex 3: If employee's grades 80 or above promote them
const employes = [
    { id: 1, name: "Alice", grade: 78 },
    { id: 2, name: "Bob", grade: 85 },
    { id: 3, name: "Charlie", grade: 92 },
    { id: 4, name: "David", grade: 88 },
    { id: 5, name: "Eva", grade: 76 },
  ];

 const newlist=[];
  for (let i=0; i< employes.length; i++) {
    if(employes[i].grade>80){
       var item =  { id: employes[i].id, status: 'Promoted' };
        newlist.push(item);

    }

  }
  console.log(newlist);
  
  // This should output:
  // [{ id: 2, status: 'Promoted' }, { id: 3, status: 'Promoted' }, { id: 4, status: 'Promoted' }]
  
  