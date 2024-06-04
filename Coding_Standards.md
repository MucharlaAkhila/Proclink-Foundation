# coding standards

Are meant have uniformity through out your code base

## Code Quality

## Dry

## Variable name

- understandable/Descriptive

```js
let a = 50; //❌
let age = 50; //✅
```

- Camel case

```js
let student_name = "Akhila"; //❌
let studentName = "Akhila"; //✅
```

- choose `let` over `var`, `const`over `let`

```js
let panCard = "BPRD2390N"; //❌
const panCard = "BPRD2390N"; //✅
const marks = [10, 20, 40]; //✅
```

- write your const case

```js
const piValue = 3.14; //❌
const PI_VALUE = 3.14; //✅
```

### Errors (for variable name)

- Reserved keywords('if' , 'for')

```js
let if ="Akhila"; //❌
```

- cannot start with numbers

```js
let 2cool = "Akhila"; //❌
```

- cannot have special symbols ($, @, #, !)
  (except for `_`)

```js
let abc$123 = "Akhila"; //❌
let abc_123 = "Akhila"; //✅
```

## Documentation

- single line comment

```js
//
```

- Multiple line comment

```js
/**
 * This is cool
 * function
 *
 *
 */
```
