From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Jan 2019 15:47:26 +0100
Subject: [Buildroot] [PATCH 10/19] support: rewrite check-bin-arch in
 python
In-Reply-To: <20190108211655.GG4022@scaer>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <638ba4cafb8ab013365ae54a393b49f459bc6e74.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LWfY8QkcveMUUgBKjBa+2TnRDoG-nHUXo7eiSZ=R7cfyQ@mail.gmail.com>
 <20190108163752.GK19623@scaer>
 <CAAXf6LXRLz7OO3-O7vByjodXF3DBO7DhAEqjaZdJ6jv-DuUAfQ@mail.gmail.com>
 <20190108203349.GE4022@scaer>
 <CAAXf6LVB+OK8AoA_eWwG0oTz+iOYrGDJzWNGrkhc9RXrBFv=Lg@mail.gmail.com>
 <20190108211655.GG4022@scaer>
Message-ID: <CAAXf6LURwLj2nEC1v-UXdsXwGNTf1T_VuzaMxvTjag4R=uhp+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 8 ene. 2019 a las 22:16, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2019-01-08 21:46 +0100, Thomas De Schampheleire spake thusly:
> > El mar., 8 ene. 2019 a las 21:33, Yann E. MORIN
> > (<yann.morin.1998@free.fr>) escribi?:
> > > And is there none() ? ;-) I guess it's "not all()"...
> > none() does not exist but if you intend what I understand by its name
> > then it is:
> > 'not any()'
>
> Dang right. "not all()" would mean at least one is not True, i.e.
> "not all(x)" ? "any(not x)"
>
> [--SNIP--]
> > > If others find the comprehensions easier to comprehend (pun), then fine,
> > > but I would be much less at ease with that.
> >
> > By all means, keep your original code.
> >
> > At least by talking about it, we have learnt each other's views and
> > shared some knowledge :-)
>
> Yes, I guess with writing more python I'd get more used to reading it.
> And I certainly did appreciate the walkthrough, thanks. :-)
>
> BTW, do you intend to join after FOSDEM?

Normally yes, although I still have to request official permission.
Possibly not all three days though, to be confirmed...

/Thomas
