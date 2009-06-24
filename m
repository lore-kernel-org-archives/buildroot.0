From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Jun 2009 16:46:32 +0200
Subject: [Buildroot] How to get symbolic debugging to work?
In-Reply-To: <20090624091656.GD22116@mx.loc> (Bernhard Reutner-Fischer's
	message of "Wed\, 24 Jun 2009 11\:16\:56 +0200")
References: <h1p5br$11r$1@ger.gmane.org> <h1r69p$kd5$1@ger.gmane.org>
	<1245830343.3872.9.camel@sven> <20090624091656.GD22116@mx.loc>
Message-ID: <87ws713d13.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> PS: I see that you don't have a required fix for m68k for
 Bernhard> 6.8, just as a sidenote

Which probably means we have very few m68k users. In fact I marked 68k
as broken back around christmas:

config BR2_m68k
        bool "m68k"
        depends on BROKEN # ice in uclibc / inet_ntoa_r

Patches are welcome if someone is interested in supporting m68k.

-- 
Bye, Peter Korsgaard
