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
