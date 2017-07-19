## Tg.js: No HTML in your JS!

Tg is a very easy way of getting a string of HTML out of your javascript without
writing any HTML. And it's short - pretty much 6 lines of coffeescript to save
you from horrible angle brackets in abhorrent strings!


### Usage
Tg is pretty amazing. I would recommend you start by trying to use it as follows:

```
Tg.p({class: 'some-class'}, "some content")  // <p class="some-class">some content</p>

Tg.div({class: 'container'},
    Tg.span("First"),
    Tg.span("Second"),
    Tg.span("Third")
) // <div class="container"><span>First</span><span>Second</span><span>Third</span></div>

Tg.br() // <br/>

// or what if you're using a non-standard tag?
Tg("ng-app", {"ng-app":"angular.Module"}) // "<ng-app ng-app="angular.Module"></ng-app>"

// and any of the content can be a function that returns a string!
Tg.div(function() { return "buahaha" }) // <div>buahaha</div>
```

Hopefully by now you can see how amazing Tg is. I'm not claiming it's the fastest
in the world (it should be pretty fast...) or the most complete in the world
(let's face it, it's a quick and dirty hack to make your code pretty). But if you've
got HTML strings in your Javascript, and you're sick of trying to remember to
close your tags, this is a pretty awesome step up!

There are a few other syntaxes that work - here's an output from the test suite
that I ran recently:

```
Tg
  ✓ generates an empty div with Tg("div")
  ✓ generates a div with static content with Tg("div", "content")
  ✓ generates a div with dynamic content with Tg("div", -> "whee")
  ✓ generates params with Tg("div", class: "foo")
  ✓ generates params and static content with Tg("div", class: "foo", "bah")
  ✓ generates params and dynamic content with Tg("div", class: "foo", -> "bah")
  ✓ concatenates any other string / fn params Tg("div", class: "foo", "whee", "bah", -> "bah")
  ✓ concatenates any arrays of string / fn params Tg("div", class: "foo", ["whee", "bah", -> "bah"], ["boo"])
  ✓ has shortcuts for common tags, e.g. Tg.div(class: foo, "whee")
  ✓ has a modifier for self-closing tags, e.g. Tg("br/")
  ✓ knows that certain shortcuts should self-close, e.g. Tg.br() == "<br/>"
```

### Development

If you want to run the tests, and you have node.js installed, you should be able to do:

```
npm install .
./run_test.sh
```


### License

Copyright (c) 2016-2017 Matthew Bennett-Lovesey

This software is offered under the terms of the MIT License, with an informal
understanding that the License and copyright notice conditions will not be enforced.

That means you are free to use and modify this software as you see fit, and with
all the liability and warranty limitations as set out in the MIT License, but as
soon as it's used in your project, it becomes - for most intents and purposes -
your code. You don't need to pass this Copyright notice on; it would be nice if
you did, but I don't care.

All I ask is that you please, *please*, reduce the amount of HTML in your JS.
