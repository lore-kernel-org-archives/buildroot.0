From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 07:58:02 +0200
Subject: [Buildroot] [PATCH] libbsd: bump to version 0.9.1
In-Reply-To: <20180606040131.drvicwte22lzicad@sapphire.tkos.co.il>
References: <f54e614d6b4a1de2ab39e843ed6266828faecd15.1528222775.git.baruch@tkos.co.il>
 <20180605221634.3a53fa0b@windsurf>
 <20180606040131.drvicwte22lzicad@sapphire.tkos.co.il>
Message-ID: <20180606075802.3f397dd9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jun 2018 07:01:31 +0300, Baruch Siach wrote:

> > because the license text itself refers to Peter Wemm.  
> 
> The libbsd COPYING fine appends the copyright holder to a number of common 
> licenses like BSD-3-clause-John-Birrell and BSD-4-clause-Niels-Provos. That's 
> probably because each COPYING entry lists specific files with their copyright 
> holders.

Correct.

> We usually only use the SPDX identifier string. So I don't think 
> there is a reason to do that for this license.

Well, normally an SPDX identifier string refers to a specific version
of the license. If the license text is different (even for subtle
reasons), the SPDX identifier string should probably be different.

> > Yocto is really using a longer list of licenses:
> > https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/libbsd/libbsd_0.8.7.bb  
> 
> The full list is only in a comment, AFAICS. 

True, indeed, I had missed that.

> The actual effective line is 
> rather shorter than what we have following this patch:
> 
> LICENSE = "BSD-4-Clause & ISC & PD"

I also think it is good enough. But I wanted to point out that the
licensing is in fact a bit more complicated. I personally don't see the
need of having a more detailed LIBBSD_LICENSE description, but I wanted
to point this out so that others can comment on this (Arnout, Yann,
Peter).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
