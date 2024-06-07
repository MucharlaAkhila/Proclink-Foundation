## shortcuts

- 'ctrl + space' -> Auto complete
- 'ctrl + shift + p' -> command palette
- 'ctrl + /' -> comment
- 'win + .' -> emojis
- 'ctrl + click' -> To search files
- 'ctrl + ` ' -> open / close terminal in vs code

### website for image compression

> squoosh

### SVG

- we can use SVG(Image format) for a good pixel quality.(The image quality remains same even if it is zoomed)
- The image file size will also be small
- For logos on websites, SVG is a good option

# JavaScript

> Datatypes available in JS:

- object
- number
- string
- undefined
- Boolean

> Declaration in JS:

- var (Redeclaration and Reassign is possible)
- let (Redeclaration is not possible and Reassign is possible)
- const (Both Redeclaration and Reassign is not possible)

> Scope : Lifetime of a variable

- let and const - block scope
- var - function scope

undefined-> its about a value(i.e, though variable is declared but it is not assigned with a value)
not defined -> its an error

> Type casting / coericion

- implicit coercion

      var y1 = 3;
      var y2 = "5";
      console.log(y1 + y2);//35(Here 3 is converted into string "3" and then concatinated with "5")
      console.log(y1 - y2);//-2(Here string "5" is converted into number 5 and then subtracted with "3")

- explicit coericion

      var y1 = 3;
      var y2 = "5";
      console.log(y1 + parseInt(y2));//8
      console.log(y1 + + y2);//8

- ==, === , which is faster ?

      var y1 = 5;
      var y2 = "5";
      console.log(y1 == y2);
      console.log(y1 === y2);

- == -> checks for values are equal (type casting is done incase of different data types)
- === -> checks for both value and datatype are equal(type casting is not allowed in it )
- therefore, === is faster than ==
  > Types of Functions

1.  Normal Function

        function double(n){
          return n*2;
        }

2.  Arrow Function

        const double = (n) =>{
          return n*2;
        };

> 5 Pillars of code quality

(order is based on priority, never miss the order)

- Readability - (75% priority)
- Maintainability - code Debt
- Extensibility / Scalability
- Testable
- Performance (Space & time complexity)

> ES6 Features

- let & const
- '' Template literal
- ... spread operater
- ... Rest operator(collecting the rest of the values)  
  ex: var[t1,t2,...t3]=[10,20,30,40,80,90]  
   (if `...` are on the left side then it is rest operator, if on right side then it is spread operator)
- Destructuring

> ES6+ Features

- Numeric separators(1_00_00_000)
- Nullish Coalescing - ?? (Null & undefined are falsy ,anything otherthan these 2 are considered as truthy)
- Optional chaining - ?

> Object methods

- Object.keys( ) & Object.values( )

> Template Literal

- `Welcome ${lastname},${firstname}`;(interpolation & template literal)
- also supports multiple line strings using back ticks

> Destructuring

const[t1 ,t2 ,t3 = 80] = [100 ,200 ,500];  
 console.log(t1 ,t2 ,t3)

- here t3 = 80 only when t3 is undefined
- here t3 = 80 is a default value

  const[,t1 ,t2 ,t3 = 80] = [100 ,200 ,Null];  
  console.log(t1 ,t2 ,t3)  
  output : 200,null,80

- here there is no key declared before t1 , this concept is konwn as `Holes`
- Unpacking in array is done by indexing and in objects it is done by keys.

> Truthy vs Falsy

- If value converts into `true` then Truthy and vice-versa(i.e, internally type casted to true or false (Boolean type))

## some useful methods

- "xyz".toUpperCase()
- "xyz".toLowerCase()
- "This is a beautiful day".split(" ") -> will split by every word(converts string into an array of words)
- "This is a beautiful day".split("") -> splits by letters
- [Array].join("|") -> will covert array into string
- Array.slice( , )

# The Software Development Cycle

1. Planning - Ideation
2. Analysis - Business & Technical
3. Design - Figma(Auto layout & Variants) , Adobe Xd , Sketch
4. Implementation
5. Testing & Integration
6. Maintenance

- Stakeholders : The people who are responsible for the make of a product(i.e, who take the risk)

> Methodologies

- Waterfall
- Agile  
  Implementation of agile is known as "SCRUM"
