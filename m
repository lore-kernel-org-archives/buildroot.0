From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 15:18:56 +0200
Subject: [Buildroot] [PATCH] Makefile: add help for
 linux-update-defconfig target
In-Reply-To: <5522871B.2050603@mind.be>
References: <1428003286-13449-1-git-send-email-yegorslists@googlemail.com>
 <5522871B.2050603@mind.be>
Message-ID: <20150406151856.17c47bc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Yegor,

On Mon, 06 Apr 2015 15:16:11 +0200, Arnout Vandecappelle wrote:

> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> > ---
> >  Makefile | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index edb122b..08b5c1e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -878,6 +878,8 @@ endif
> >  ifeq ($(BR2_LINUX_KERNEL),y)
> >  	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
> >  	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
> > +	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
> > +	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'

Why just for linux and not for all kconfig based packages ? Why
<foo>-update-defconfig and not <foo>-update-config ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
