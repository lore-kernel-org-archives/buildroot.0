From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Feb 2014 19:27:09 +0100
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <20140212182348.GB17804@free.fr>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212182348.GB17804@free.fr>
Message-ID: <20140212182709.GC17804@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-12 19:23 +0100, Yann E. MORIN spake thusly:
> On 2013-10-08 20:05 -0700, Eric Nelson spake thusly:
> > Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
> [--SNIP--]
> > diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
> > index 0dd5629..39ffa8a 100644
> > --- a/package/freescale-imx/freescale-imx.mk
> > +++ b/package/freescale-imx/freescale-imx.mk
> > @@ -4,9 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -FREESCALE_IMX_VERSION = 1.1.0
> > -
> > -# No official download site from freescale, just this mirror
> > -FREESCALE_IMX_SITE   = http://download.ossystems.com.br/bsp/freescale/source
> > +FREESCALE_IMX_VERSION = 3.5.7-1.0.0
> > +FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/
> 
> It looks like this site is no longer valid. The webpage states:
> 
>     The system is currently unavailable.
> 
> And trying to retrieve any tarball from there result in a 404:
> 
>     $ wget 'http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/gpu-viv-bin-mx6q-3.5.7-1.0.0.bin'
>     HTTP request sent, awaiting response... 404 Not Found

OK, bear with me, I made a typo when copy-pasting the tarball name: I
forgot to append either -sfp or -hfp. With that added, the tarball
downloads OK.

So, forget my previous mail.  I'll do another pass at testing this better.

Sorry for the noise. :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
