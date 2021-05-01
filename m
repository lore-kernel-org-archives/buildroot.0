From: D. Olsson <hi@senzilla.io>
Date: Sat, 01 May 2021 15:27:23 +0000
Subject: [Buildroot] [PATCH 1/4] package/{skalibs, execline, s6,
 s6-dns}: change prefix and shared options
In-Reply-To: <20210407202353.GA359705@scaer>
References: <HbmuNdRmOn2PdMjzu0i70kXEVtJ7gzFTC74uRm0Le50@cp3-web-012.plabs.ch>
 <df3d4c00-dd75-73f5-ed4a-74d53b9e3467@mind.be>
 <20210407202353.GA359705@scaer>
Message-ID: <V2Ta0gsqMCjUcsTA-XuRTEjzp_GOtz46kcF5U061p0eH5ThNeL4uTB_fKgjV86fi4BbDfNiPgpfjy3RoFej7tsDhEO1BUkN6hA2b3N8X3nc=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Arnout,

On Wednesday, April 7th, 2021 at 8:23 PM, Yann E. MORIN wrote:

> Since one may use s6 as an init system. and now that we have had the s6
> family of packages for a while, would it make sense to promote them to
> an init system supported by Buildroot?
>
> There was some discussion about that in the past, but I am not sure I
> remember the rationale for not making s6 a full-fledged init system,
> like we have for busybox, system V, openrc, or systemd.

Yes, it definitely makes sense. I haven't read up on the past
conversations but I can imagine it was not done because there a are
quite a few steps involved in doing it. But I'm already working on
a patchset for it! Stay tuned :)

> In the state, I too am not too fond of it. However...
> ... if the ska-related packages would really benefit from having
> shared variables, then we could look at it like we look at qt5, or as
> Arnout mentions, like freescale stuff.

I do believe there would be beneficial for a few reasons...

> > I'm not really sure about all this, so I put the other maintainers in Cc of
> > this mail.
>
> Neither am I; that's only 4 packages impacted, i.e. the library plus
> three packages. I am not sure this-few packages deserve shared variables.

... there are 5-6 other ska-related packages that I want to package.
After I have submitted patchset for those additional packages we are looking at
around 10 packages in total that all share build system. Being able easily keep
them all aligned would be good.

So in essence, I do think that something similar to qt5/freescale makes sense.
I'll eventually get those patchsets in, then we can review and discuss further!


Cheers

D. Olsson
PGP: 8204A8CD
