From: Francisco Gonzalez <gzmorell@gmail.com>
Date: Wed, 4 Nov 2009 12:58:03 +0100
Subject: [Buildroot] buildroot-2009.08 does not build on Ubuntu 9.10
In-Reply-To: <4d71bb0f0911031424s5ef63179m24a14c559d5782da@mail.gmail.com>
References: <4d71bb0f0911031424s5ef63179m24a14c559d5782da@mail.gmail.com>
Message-ID: <fffd86390911040358s4fe28b08iae1a6123978f4a7d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/11/3 Grigory Ptashko <gptashko@cmmt.ru>

> Hello.
>
> I've recently installed Ubuntu 9.10. Today I downloaded buildroot-2009.08.
> It does not build in its default configuration.  I am attaching the output
> from make, it is not big since it falis almost right after the build start.
> Previously I used buildroot on Ubuntu 8.04LTS. Everything was ok. Can anyone
> suggest me anything?
>

I have built buildroot-2009.08 with Kubuntu 9.10 for arm target without
problems. What target are you using?, from the attached file it seems i686,
but it does not appears in the menuconfig in buildroot-2009.08. Have you
tried the same version (2009.08) and .config in Ubuntu 8.04?






> My Ubuntu version is:
>
> trancer at terminal:/etc$ cat lsb-release
> DISTRIB_ID=Ubuntu
> DISTRIB_RELEASE=9.10
> DISTRIB_CODENAME=karmic
> DISTRIB_DESCRIPTION="Ubuntu 9.10"
>
>
> Thank you in advance,
> Grigory.
>
> --
> ? ?????????,
> ???????? ??????
>
> +7 (916) 1489766
> gptashko at cmmt.ru
> http://www.cmmt.ru
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091104/26feebbf/attachment.htm>
