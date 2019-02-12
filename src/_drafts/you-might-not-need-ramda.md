---
layout: post
title: You Might Not Need Ramda
---

[Ramda](https://ramdajs.com/docs/) was useful when it came out, but as newer versions of javascript and the browsers that support them are adopted, you might not need it as much as you think.

Using native solutions is better because ...

To find which Ramda functions you most commonly use, navigate to your project and run `ack -ho R\\.\\w* | sort | uniq -c | sort -h`

## [R.add](https://ramdajs.com/docs/#add)

The first of many simple math functions

I'm sure you don't need this spelling out but:

```js
// Instead of this
R.add(2, 3)
// try this
2 + 3

// Instead of this
R.add(7)
// try this
x => x + 7
```

## [R.addIndex](https://ramdajs.com/docs/#addIndex)

I'll not go into detail for this one, but the example they give is to turn `R.map` into something similar to `Array.prototype.map`. I'd suggest just using `Array.prototype.map` if that's what you want.

## [R.cond](https://ramdajs.com/docs/#cond)

Many common uses of `cond` are simpler without it

```js
// Instead of this
R.cond([
  [R.equals('dog'), R.always('bark')],
  [R.equals('cat'), R.always('meow')],
  [R.equals('rat'), R.always('squeak')],
  [R.T, R.always('grunt')],
])
// try this
animal =>
  animal === 'dog' ? 'bark' :
  animal === 'cat' ? 'meow' :
  animal === 'rat' ? 'squeak' :
  'grunt'
// or this
animal => ({
  dog: 'bark',
  cat: 'meow',
  rat: 'squeak',
}[animal] || 'grunt')
```

{:.bad}
```js
// Instead of this
R.cond([
  [R.equals(DOG), says('bark')],
  [R.equals(CAT), says('meow')],
  [R.equals(RAT), says('squeak')],
  [R.T, says('grunt')],
])
// try this
animal =>
  animal === DOG ? says('bark', animal) :
  animal === CAT ? says('meow', animal) :
  animal === RAT ? says('squeak', animal) :
  says('grunt', animal)
// or this
animal => {
  const noise = {
    [DOG]: 'bark',
    [CAT]: 'meow',
    [RAT]: 'squeak',
  }[animal] || 'grunt'
  return says(noise, animal)
}
```

## [R.pipe](https://ramdajs.com/docs/#pipe)

```js
const getRequiredFieldsKeys = R.pipe(R.filter(f => f.required), R.pluck('key'));
const getRequiredFieldsKeys = i => i.filter(f => f.required).map(f => f.key);
```