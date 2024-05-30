const marks = [80,90,100,70,60];

//more control on i value
for(let i = 0; i< marks.length;i++){
    console.log("index:",i,"mark: "marks[i]);
}

// Readable and simple (for in)
for(let idx in marks){
    console.log("index:",idx,"mark: "marks[idx]);
}

// Readable and cleaner (for of)
for(let mark of marks){
    console.log("mark: ",mark);
}