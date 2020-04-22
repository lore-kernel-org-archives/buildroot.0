From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2020 22:30:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 5.6.0
In-Reply-To: <20200422202853.GI5035@scaer>
References: <20200422193806.26726-1-petr.vorel@gmail.com>
 <20200422202853.GI5035@scaer>
Message-ID: <20200422203015.GJ5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2020-04-22 22:28 +0200, Yann E. MORIN spake thusly:
> fabrice, All,

Sorry, I got confused with another patch when preparing the reply to
yours.

Thanks Petr for your patch. :-)

Regards,
Yann E. MORIN.

> On 2020-04-22 21:38 +0200, Petr Vorel spake thusly:
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
> > ---
> >  package/iproute2/iproute2.hash | 2 +-
> >  package/iproute2/iproute2.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> > index c451cfa941..27b4eaaa15 100644
> > --- a/package/iproute2/iproute2.hash
> > +++ b/package/iproute2/iproute2.hash
> > @@ -1,3 +1,3 @@
> >  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> > -sha256	bac543435cac208a11db44c9cc8e35aa902befef8750594654ee71941c388f7b  iproute2-5.5.0.tar.xz
> > +sha256	1b5b0e25ce6e23da7526ea1da044e814ad85ba761b10dd29c2b027c056b04692  iproute2-5.6.0.tar.xz
> >  sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4	COPYING
> > diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> > index a2e2d25d81..6d20f65f34 100644
> > --- a/package/iproute2/iproute2.mk
> > +++ b/package/iproute2/iproute2.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -IPROUTE2_VERSION = 5.5.0
> > +IPROUTE2_VERSION = 5.6.0
> >  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
> >  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
> >  IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
> > -- 
> > 2.26.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
