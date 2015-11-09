From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Nov 2015 22:23:09 +0100
Subject: [Buildroot] [PATCH] configs: new configuration for at91sam9g20ek
In-Reply-To: <20151109115525.GA4302@piout.net>
References: <1447032023-6229-1-git-send-email-jenskamenik@googlemail.com>
 <20151109115525.GA4302@piout.net>
Message-ID: <20151109222309.67599ac2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex,

On Mon, 9 Nov 2015 12:55:25 +0100, Alexandre Belloni wrote:

> regarding the sort order, I'd say that at91sam9g20ek is not between
> at91sam9g15ek and at91sam9g25ek (both part of the at91sam9x5 familiy). I
> would place it before at91sam9g45m10ek. That comment is also valid for
> the family_, mach_ and dtb_ definitions

I think you should explain why. It's because you're not interested in
alphabetic ordering here, but rather "release date" ordering of the
platform. Is that correct ?


> > diff --git a/configs/at91sam9g20ek_defconfig b/configs/at91sam9g20ek_defconfig
> > new file mode 100644
> > index 0000000..10125e1
> > --- /dev/null
> > +++ b/configs/at91sam9g20ek_defconfig
> > @@ -0,0 +1,23 @@
> > +BR2_arm=y
> > +BR2_KERNEL_HEADERS_VERSION=y
> > +BR2_DEFAULT_KERNEL_VERSION="3.18"
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
> 
> These can probably be updated to 4.1

Indeed.

Jens, can you fix those two issues and send an updated version of your
patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
