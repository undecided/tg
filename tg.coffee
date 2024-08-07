Tg = (tagname, others...)->
  isHash = (x)-> typeof x == "object" && !(x instanceof Array)
  opts = if isHash(others[0]) then others.shift() else if isHash(others[others.length - 1]) then others.pop() else {}
  children = ((if typeof child is 'function' then child() else child) for child in [].concat(others...)).join('')
  tagroot = tagname.replace('/', '')
  tag = [tagroot,("#{k}=\"#{opts[k]}\"" for own k of opts)...].join(' ')
  if tagname.indexOf('/') > -1 and children == "" then "<#{tag}/>" else "<#{tag}>#{children}</#{tagroot}>"
((u) -> (Tg[u.replace('/', '')] = (others...) => Tg(u, others...)))(t) for t in "area/ base/ br/ col/ command/ embed/ hr/ img/ input/ keygen/ link/ meta/ param/ source/ track/ wbr/ a abbr address article aside audio b bdi bdo blockquote body button canvas caption cite code colgroup data datalist dd del dfn div dl dt em fieldset figcaption figure footer form h1 h2 h3 h4 h5 h6 head header html i iframe ins kbd label legend li main map mark meter nav noscript object ol optgroup option output p pre progress q rb rp rt rtc ruby s samp script section select small span strong style sub sup table tbody td template textarea tfoot th thead time title tr u ul var video".split(' ')
@Tg = Tg
module.exports = Tg if module?.exports?
