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

There are a few other syntaxes that work - here's an output from the test suite for reference:

```
Tg
  ✔ generates an empty div with Tg("div")
  ✔ generates a div with static content with Tg("div", "content")
  ✔ generates a div with dynamic content with Tg("div", -> "whee")
  ✔ generates with params at the back like Tg("div", class: "foo")
  ✔ generates with params at the front like Tg.div({class: "foo"}, "some content")
  ✔ generates params and static content with Tg("div", class: "foo", "bah")
  ✔ generates params and dynamic content with Tg("div", class: "foo", -> "bah")
  ✔ concatenates any other string / fn params Tg("div", class: "foo", "whee", "bah", -> "bah")
  ✔ concatenates any arrays of string / fn params Tg("div", class: "foo", ["whee", "bah", -> "bah"], ["boo"])
  ✔ has shortcuts for common tags, e.g. Tg.div(class: foo, "whee")
  ✔ has a modifier for self-closing tags, e.g. Tg("br/")
  ✔ knows that certain shortcuts should self-close, e.g. Tg.br() == "<br/>"
  ✔ treats attrs for self-closing tags correctly, e.g. Tg.br(class: "foo") == "<br class="foo"/>"
  ✔ knows that self-closers can sometimes have content too, e.g. Tg.br("Hi") == "<br>Hi</br>"
```

### IAQ (Infrequently Asked Questions)

#### - What about Doctypes?

Sorry, no support for those (yet)

#### - What about LIs? They can be legitimately used without a closing tag...

Sure, they can. But why would you?

Seriously, if someone can come up with a genuine best-practices use-case, I'll come up with a syntax for it.

#### - I DEMAND you support shortcuts for \<marquee\> tags!

Do it yourself! `Tg["marquee"] = (...others) => { return Tg("marquee", ...others); };`



### Installation

Kinda up to you. If you want the coffeescript file, use `tg.coffee`. If you want js,
there's `build/tg.js` and `build/tg.min.js` and even a gzipped version in there.


### Development

If you want to run the tests, and you have node.js installed, you should be able to do:

```
npm install .
./run_tests.sh
```

This will create js and minified versions in the build folder if the tests pass


### License

Copyright (c) 2016-2024 Matthew Bennett-Lovesey

This software is offered under the terms of the MIT No Attribution License (MIT-0)

That means you are free to use and modify this software as you see fit, and with
all the liability and warranty limitations as set out in the MIT License, but as
soon as it's used in your project, it becomes - for most intents and purposes -
your code. You don't need to pass this Copyright notice on; it would be nice if
you did, but I don't care. You are free to make edits to it without telling anyone.

All I ask is that you please, *please*, reduce the amount of HTML in your JS.
