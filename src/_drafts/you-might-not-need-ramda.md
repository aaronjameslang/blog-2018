---
layout: post
title: You Might Not Need Ramda
---

[Ramda](https://ramdajs.com/docs/) was useful when it can out, but as newer versions of javascript and the browsers that support them are adopted, you might not need it as much as you think.

Using native solutions is better because ...

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