---
title: Ideas for Improving Type Promotion in GHC
---

Problem: Few base types can be promoted. I.e. `Natural` to `Nats` and
`Text` to `Symbol`.

TODO look up how type promotion for `Symbol` and `Nat` is actually
implemented.

If, as an example, we wanted to implement promoted `ByteString`s, we
could define them as lists of bytes. But bytes would have to be built
from ADTs.

E.g.

```haskell
data Byte = Byte Nibble Nibble
data Nibble = Nibble Bool Bool Bool Bool
```

Then

```haskell
data ByteString' = ByteString' [Byte]
```

is promotable.

(This is presumably because we now have a purely inductive type.)

Now we need to establish the promotion/demotion relation such that
`Demote ByteString'` is `ByteString`.

The singletons library can presumably be easily extended to say
this. We would need to supply an isomorphism `ByteString'` ->
`ByteString`.

How do we promote functions now? `ByteString` appearing in a function
signature would need to be `ByteString'` in the promoted kind
signature.

We need to establish `Sing ByteString` = `Sing ByteString'`?

The above mentioned isomorphism would be used to implement the
`SingKind ByteString'` instance.

Problem: How do we write promoted constants? The promoted constructors
are of course available, but might be awkward.

Problem: Presumably none of the native functions operating on
`ByteString`f can be promoted.

A lot can probably be done just using isomorphic ADTs. (Actually the
isomorphism question could be tricky, e.g., for `Int`)
