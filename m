From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Feb 2009 13:27:35 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <D071C392448744ECA7A451C54A46ABE6@aeglos> (Ulf Samuelsson's
	message of "Fri\, 6 Feb 2009 09\:56\:46 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<1233865432.4148.6.camel@elrond.atmel.com>
	<87eiycarei.fsf@macbook.be.48ers.dk>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
Message-ID: <878wojagy0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Yes, but again, when you work on multiple boards, it is a useless name
 Ulf> If you look at commercial linux support (aty least Timesys), they do
 Ulf> not distribute
 Ulf> files called "uImage", their naming is similar to the current.

Ok, but whatever timesys does shouldn't be the deciding factor for
what we do in BR, especially when there's objections from the
developers (here and on irc).

 Ulf> If symlinks are no good, and I dont understand why, then a duplicate
 Ulf> would work for me.

That would be silly, just set prefix/suffix to what you want.

-- 
Bye, Peter Korsgaard
