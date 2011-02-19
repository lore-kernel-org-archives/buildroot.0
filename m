From: =?UTF-8?Q?Zden=C4=9Bk_Materna?= <zdenek.materna@gmail.com>
Date: Sat, 19 Feb 2011 14:56:40 +0100
Subject: [Buildroot] Problem with gmp library
In-Reply-To: <AANLkTikgbWnPj3CJ7-PcV78YyeVxBHQrd9sugp1vKNgg@mail.gmail.com>
References: <AANLkTimDr-hb4wUZBG+tqavQyDhiRZJ791n==JgbmU+w@mail.gmail.com>
	<AANLkTikFLQ8AdekPMkaZzEUFJPxb22W2FmZaoBkfSYcS@mail.gmail.com>
	<AANLkTikgbWnPj3CJ7-PcV78YyeVxBHQrd9sugp1vKNgg@mail.gmail.com>
Message-ID: <AANLkTi=6aOJEZWZmJaXTqB7wHzDOnQiUYCkekGE_PtQX@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tryed to do "make clean" and then "make" and it was same. Builroot from
git with  qemu_arm_versatile_defconfig was compiled fine. Thanks a lot for
advice. I thought that stable versions are more tested so they should
compile without problems (or at least with less problems). But it seems that
my assumption wasn't right :-)

Regards,
Zdenek Materna

2011/2/18 Bj?rn Forsman <bjorn.forsman@gmail.com>

> Hi,
>
> 2011/2/18 Zden?k Materna <zdenek.materna@gmail.com>:
> > Here is Buildroot's .config, and config.log of mpfr and gmp. I'm sorry
> for
> > another mail - forgot to attach link in previous one.
> >
> > http://sestka.zlutaponorka.com/zd/logs.zip
>
> I tried your .config in git master and cannot reproduce the error
> (Ubuntu 10.10 64-bit host).
> (There were som other build errors, but not related to this.)
>
> 1. Have you tried fully cleaning your Buildroot directory and building
> it again? Still errors?
> 2. If it still fails, try updating your tree to git master (and do a
> full clean before building).
>
> BTW, you could use 'make qemu_arm_versatile_defconfig' in git master
> as base for the Olimex SAM9-L9260 board, just change the kernel
> settings.
>
> Best regards,
> Bj?rn Forsman
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110219/83f95b19/attachment.html>
