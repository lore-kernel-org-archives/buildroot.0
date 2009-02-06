From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Feb 2009 13:30:07 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <A56AD9EF90944EFB93E86E3692353870@aeglos> (Ulf Samuelsson's
	message of "Fri\, 6 Feb 2009 10\:06\:29 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
	<87vdrpaug2.fsf@macbook.be.48ers.dk>
	<1233866252.4148.12.camel@elrond.atmel.com>
	<d6cda7730902051828if9915d3u31cf79bf5a68fcac@mail.gmail.com>
	<1233900994.26426.10.camel@elrond.atmel.com>
	<871vucar1o.fsf@macbook.be.48ers.dk>
	<A56AD9EF90944EFB93E86E3692353870@aeglos>
Message-ID: <874oz7agts.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> So they are broken for people using the simple linux build already?

 Ulf> ==> The previous default was to use the advanced build, if my memory
 Ulf>        does not fail me.

For certain atmel boards, yes.

 Ulf> No, lets not add any more clutter to binaries/

 Ulf> ==> If you do not like that solution, then letting people that
 Ulf>       want uImage , build the simple linux would work for me.
 Ulf>       But your opinion seems to be that you want to do things
 Ulf>       in a certain way, and you want to ensure that noone
 Ulf>       can do it in a different way, regardless if their use case
 Ulf>       is different from yours.

Sigh, we are talking about making the name configurable, instead of
the current hardcoded settings. I don't see where that takes away any
functionality from your use cases? It's the current setup that forces
certain ways of doing stuff.

-- 
Bye, Peter Korsgaard
