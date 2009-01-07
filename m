From: Nigel Kukard <nkukard@lbsd.net>
Date: Wed, 07 Jan 2009 12:24:52 +0000
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231330238.32308.334.camel@elrond.atmel.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>	<1231243376.32308.52.camel@elrond.atmel.com>	<87vdsssiwo.fsf@macbook.be.48ers.dk>	<200901070409.42558.markus.heidelberg@web.de>	<1231326832.32308.320.camel@elrond.atmel.com>	<87prizl5im.fsf@macbook.be.48ers.dk>
	<1231330238.32308.334.camel@elrond.atmel.com>
Message-ID: <49649F14.6040106@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Since we have opposing views, then I think the rest of the 
> people interested in maintaining buildroot, needs to 
> also show their desires before any drastic actions in either
> direction is taken.
>   
I for one am in agreement with Peter's views. I'm not going to type out
50 gazillion pages stating nearly exactly what he's stated in the past
few/many posts so I will keep it to one LOONG sentance.

We design and develop embedded i586/x86_64 software solutions covered by
SLAs, while I agree that changing one or two packages should not break
everyones build, that is why MAINTAINERS are required to ensure the
changes made do not break everything and if it does break something
unrelated the MAINTAINER of that must fix it and it should not become a
blocking factor to follow upstream closely.

-N
