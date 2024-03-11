assert = require('assert')
Tg = require('../tg')

describe 'Tg', ->
  it 'generates an empty div with Tg("div")', ->
    assert.equal('<div></div>', Tg('div'))
  it 'generates a div with static content with Tg("div", "content")', ->
    assert.equal('<div>content</div>', Tg('div', 'content'))
  it 'generates a div with dynamic content with Tg("div", -> "whee")', ->
    assert.equal('<div>whee</div>', Tg('div', -> 'whee'))
  it 'generates params with Tg("div", class: "foo")', ->
    assert.equal('<div class="foo"></div>', Tg('div', class: 'foo'))
  it 'generates params and static content with Tg("div", class: "foo", "bah")', ->
    assert.equal('<div class="foo">bah</div>', Tg('div', class: 'foo', 'bah'))
  it 'generates params and dynamic content with Tg("div", class: "foo", -> "bah")', ->
    assert.equal('<div class="foo">bah</div>', Tg('div', class: 'foo', -> 'bah'))
  it 'concatenates any other string / fn params Tg("div", class: "foo", "whee", "bah", -> "bah")', ->
    assert.equal('<div class="foo">wheebahbah</div>', Tg('div', class: 'foo', "whee", "bah", -> "bah"))
  it 'concatenates any arrays of string / fn params Tg("div", class: "foo", ["whee", "bah", -> "bah"], ["boo"])', ->
    assert.equal('<div class="foo">wheebahbahboo</div>', Tg('div', class: 'foo', ["whee", "bah", -> "bah"], ["boo"]))
  it 'has shortcuts for common tags, e.g. Tg.div(class: foo, "whee")', ->
    assert.equal('<div class="foo">whee</div>', Tg.div(class: 'foo', "whee"))
  it 'has a modifier for self-closing tags, e.g. Tg("br/")', ->
    assert.equal('<br/>', Tg("br/"))
  it 'knows that certain shortcuts should self-close, e.g. Tg.br() == "<br/>"', ->
    assert.equal('<br/>', Tg.br())
  it 'knows that self-closers can sometimes have content too, e.g. Tg.br("Hi") == "<br>Hi</br>"', ->
    assert.equal('<br>Hi</br>', Tg.br("Hi"))
