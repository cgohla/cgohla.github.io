---
title: Basic Rewriting
---

Let me talk a little bit about a cool paper on rewriting theory
that I'm reading:
<https://dl.acm.org/citation.cfm?doid=322217.322230>

Let's say have a set of items, and you're allowed to hold on to one
item at a time.

And there is a bunch of rules, saying which items you're allowed to
trade for which other items. An obvious question is: Can you get a
specific item, starting with a given one through repeated
exchanges?

If the items are a cherry, a pear, and an egg; and rules saying you
may exchange *Cherries ⇀ Pear*, *Pear ⇀ Peach*, and *Egg ⇀ Pear*; then
you can obviously get the *Egg* from the *Cherries* in two steps (one
rule has to be used backwards).

We would like to know for which rule sets we could program a
computer to decide this question for us. The paper tells us under
which conditions on a sets of rules this is possible (and some
generalizations and applications, which I'm not going to mention).

Small aside: The problem is trivial when the set of items is
finite, because we can just enumerate all the possibilities in a
finite number of steps. The problem becomes interesting, when, for
example, the items being exchanged are the terms in a language.

So we have to be a bit more clever.

First, let's agree to treat the rules as unidirectional. We can use
them both ways, but they have to have a direction and we are mostly
interested in using them in the forward direction.

## Confluence ##

A property that our rule set might have is called «confluence»:
Starting with any item α, and any two sequences of exchanges
yielding ξ and υ respectively, there is always an item β, that can
be obtained from both ξ and υ through further sequences of
exchanges.

In a picture:

```
α → ξ
↓   ↓
υ → β
```

where the arrows are sequences of forward exchanges *⇀ ⋯ ⇀*.

The first important (but easy) result in the paper now says that any
sequence of forward and backward applications of our exchange rules,
e.g. *↼ ↼ ↼ ⇀ ↼ ⇀ ↼ ⇀ ↼ ⇀ ⇀*, can be replaced by a sequence of just
forward applications followed by a sequence of just backward
applications, e.g. *⇀ ⇀ ⇀ ↼ ↼*, _if_ our rule set has the confluence
property.

## Wellfoundedness ##

Another property that our rule system may have, is called
«well-foundedness»: It requires that, if we start with any item, say
α, and we keep using any applicable exchange rules in the forward
direction, we must eventually get some item β, that can not be
exchanged for anything else.

I.e., in a well-founded rule system no sequence of forward
exchanges can go on forever; arguably an essential property if we want
to write a computer program, that always gives an answer.

Now, if our rule system has both the confluence and the
well-foundedness property, then not only will *every* sequence of
exchanges eventually end, but for every α we start with, there is
exactly one β that it can end with.

And this is actually easy to see: lets say you started with α, by
well-foundedness, after a finite number of forward steps you can't
go any further and end up with β; but maybe if you had used a
different sequence of steps, you would have ended up with β'.

Now confluence tell us there are sequences of further steps, that
would give us a γ from both β and β'. But how could we possibly
find these sequences?

Luckily, our rule system is well-founded, meaning no further
exchanges of β and β' are possible, so the two sequences we would
need to find are empty, meaning β and β' (and the putative γ) have
to be equal.

So now we have a recipe for solving our initial question of whether
we can get one item from another by repeated forward and backward
exchanges (under the assumption that our rule system is confluent
and well founded):

Take both items, keep applying the exchange rules in the forward
direction until you can't go further and you get two items uniquely
determined by the starting points; compare them, if they are equal,
the answer is yes; otherwise it is no.

## Conclusion ##

These are the generalities that I wanted to share. The actual hard
work is of course in showing that a given rule system actually is
well-founded and confluent.
