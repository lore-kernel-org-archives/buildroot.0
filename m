From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Jan 2009 10:15:13 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <200901090013.01339.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Fri\, 9 Jan 2009 00\:13\:01 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901082306.29783.markus.heidelberg@web.de>
	<1231453993.9711.27.camel@elrond.atmel.com>
	<200901090013.01339.markus.heidelberg@web.de>
Message-ID: <87priwrgbi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> I have never objected. But it depends on the type of the
 Markus> patch. A simple patch that adds some architecture specific
 Markus> configurations (endian or something) to get it working
 Markus> belongs to uclibc-buildroot. And even there it can require
 Markus> some investigation to update the patch, if the source code
 Markus> base has changed. And this investigation should be avoided
 Markus> with pushing it upstream.

 Markus> But a huge patch that adds lots of optimization code
 Markus> (mplayer) definetly belongs to avr32-buildroot.

I agree - Or atleast not in the buildroot I care about. Same with
feature patches, like the ones recently added to U-Boot. We really
need to keep patches to a minimum (and push them upstream) to stay
sane.

I repeat, Buildroot is not a dumping ground for random patches.

-- 
Bye, Peter Korsgaard
