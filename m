From: Nigel Kukard <nkukard@lbsd.net>
Date: Wed, 07 Jan 2009 08:31:31 +0000
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87y6xnldvt.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>	<1231243376.32308.52.camel@elrond.atmel.com>	<87vdsssiwo.fsf@macbook.be.48ers.dk>	<200901070409.42558.markus.heidelberg@web.de>
	<87y6xnldvt.fsf@macbook.be.48ers.dk>
Message-ID: <49646863.1000403@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  Ulf> You have complained about size of patches, and 
>  Ulf> that is why there is a prepatched toolchain for AVR32.
>  Ulf> If that is not considered to be OK, then the several
>  Ulf> MBytes of patches has to be introduced into the trunk.
>  >> 
>  >> It's not the size in bytes as such, it's the special casing and
>  >> (effectively) black box patches. Even when you test your changes on
>  >> multiple archs there's a fairly big change that you break stuff for
>  >> avr32/at91, or that you guys break it for the other archs. The same
>  >> with moving packages to new versions or removing old versions, you
>  >> cannot expect other people to forward port those arch specific
>  >> patches.
>
>  Markus> Yes, mplayer for example is more than 2 years old and includes a huge
>  Markus> avr32 patch.
>
> Exactly. Who will redo this patch if I bump the mplayer version
Perfect example why we need the MAINTAINERS file, ie. who is responsible
for keeping the $arch/target patches up to date?

-N
