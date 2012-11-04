From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Nov 2012 13:36:02 +0100
Subject: [Buildroot] [PATCH 12/20] toolchain-external: add Sourcery
 CodeBench x86 2012.03
In-Reply-To: <20121104121138.GD32575@sapphire.tkos.co.il>
References: <cover.1352030430.git.thomas.petazzoni@free-electrons.com>
 <f5732d375df9b187e90340ef003a073efcf4c291.1352030430.git.thomas.petazzoni@free-electrons.com>
 <20121104121138.GD32575@sapphire.tkos.co.il>
Message-ID: <20121104133602.3f555758@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun, 4 Nov 2012 14:11:39 +0200, Baruch Siach wrote:

> > diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> > index f73273c..e7c9995 100644
> > --- a/toolchain/toolchain-external/Config.in
> > +++ b/toolchain/toolchain-external/Config.in
> > @@ -431,7 +431,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
> >  	  Sourcery CodeBench toolchain for the SuperH architecture,
> >  	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
> >  	  glibc 2.15, uClibc 0.9.30, gdb 7.2.50 and kernel headers
> > -	  2.6.38. It has support for the following variants:
> > +	  3.2.10. It has support for the following variants:
> 
> This hunk should be squashed into the previous patch.

Argggh, yes. This is a rebase mistake on my part. I squashed this hunk
into the wrong commit.

Thanks for noticing, I'll fix that up.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
