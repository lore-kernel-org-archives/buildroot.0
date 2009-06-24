From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Jun 2009 17:12:49 +0200
Subject: [Buildroot] How to get symbolic debugging to work?
In-Reply-To: <87ws713d13.fsf@macbook.be.48ers.dk>
References: <h1p5br$11r$1@ger.gmane.org> <h1r69p$kd5$1@ger.gmane.org>
	<1245830343.3872.9.camel@sven> <20090624091656.GD22116@mx.loc>
	<87ws713d13.fsf@macbook.be.48ers.dk>
Message-ID: <20090624151249.GF22116@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 24, 2009 at 04:46:32PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
>Hi,
>
> Bernhard> PS: I see that you don't have a required fix for m68k for
> Bernhard> 6.8, just as a sidenote
>
>Which probably means we have very few m68k users. In fact I marked 68k
>as broken back around christmas:
>
>config BR2_m68k
>        bool "m68k"
>        depends on BROKEN # ice in uclibc / inet_ntoa_r
>
>Patches are welcome if someone is interested in supporting m68k.

worked in my tree, i point any interrested party to factor out the
needed bits and submit it to here..

HTH,
