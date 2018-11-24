From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 24 Nov 2018 14:50:41 +0100
Subject: [Buildroot] [PATCH 4/6]
 configs/olimex_a20_olinuxino_lime_legacy: use gcc 6.x and not the default
 version
In-Reply-To: <df6acac2-f862-d153-155c-826132591520@lucaceresoli.net>
References: <20181122094150.10403-1-thomas.petazzoni@bootlin.com>
 <20181122094150.10403-4-thomas.petazzoni@bootlin.com>
 <df6acac2-f862-d153-155c-826132591520@lucaceresoli.net>
Message-ID: <CAB0FRstukk+O5Dx1k4GXUJ=bPOL_czKkUn6NHeY0psvWeqG=Dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 23 nov. 2018 ? 14:57, Luca Ceresoli <luca@lucaceresoli.net> a
?crit :

> Hi Thomas,
>
> On 22/11/18 10:41, Thomas Petazzoni wrote:
> > The old 3.4 Linux kernel used by this defconfig doesn't build with gcc
> 7.x:
> >
> > include/linux/compiler-gcc.h:106:1: fatal error: linux/compiler-gcc7.h:
> No such file or directory
> >
> > So let's use gcc 6.x for the time being.
> >
> > Long term, we should use a newer or different kernel source for this
> > defconfig, or get rid of the defconfig entirely if there's no updated
> > kernel with a fix.
>
> Adding the author of the Lime legacy support to the recipients.
>
>
After the release of BR 2019.02, I will remove:
 - configs/olimex_a20_olinuxino_lime_legacy_defconfig
 - package/sunxi-mali

Now, we have package/sunxi-mali-mainline.

Fran?ois


> Fran?ois, if memory serves, the old kernel was needed for GPU support.
> Is it still the case?
>
> Thanks,
> --
> Luca
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181124/ae79fe36/attachment.html>
