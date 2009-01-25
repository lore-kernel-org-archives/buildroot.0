From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Jan 2009 22:12:28 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target:	device/Atmel/at91rm9200df
	device/Atmel/a etc...
In-Reply-To: <1232917612.2298.2.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sun\, 25 Jan 2009 22\:06\:52 +0100")
References: <20090125201134.560DF768D3@busybox.osuosl.org>
	<1232917612.2298.2.camel@elrond.atmel.com>
Message-ID: <87d4ebdr9f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Don't do this!

Why not? xconfig doesn't buy you any more functionality, but it DOES
break if you don't have QT3 headers installed on the host (which we
don't check for)

I don't see why we need to provide the xconfig option in the first
place.

 Ulf> Either you revert, or I will do it.

 Ulf> You are NOT the maintainer of these boards.

I am of BR, and we're getting mails from people where the xconfig
stuff breaks.

-- 
Bye, Peter Korsgaard
