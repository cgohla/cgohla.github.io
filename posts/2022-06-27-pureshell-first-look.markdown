---
title: PureShell… First Light
---

I've been working on a
[PureScript](https://en.wikipedia.org/wiki/PureScript) back-end
targeting [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)),
which I call [PureShell](https://github.com/cgohla/pureshell). And I
now have all stages working, so I can turn this

```PureScript
module Example.Literals where

foo :: String
foo = "Hello"

bar :: String
bar = "There is no cheese ✓"

baz :: String
baz = "$baz"

α :: String
α = "alpha"

foo' :: String
foo' = "BOOM"
```

into this

```bash
#!/bin/bash
set -o errexit -o nounset -o pipefail

function p206p177 {
  echo alpha
}
function foop39 {
  echo BOOM
}
function foo {
  echo Hello
}
function baz {
  echo $'$baz'
}
function bar {
  echo $'There is no cheese \xE2\x9C\x93'
}
```

This is about all it can do for now though, since the first lowering
stage is still very incomplete.
