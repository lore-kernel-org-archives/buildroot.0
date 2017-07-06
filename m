From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 6 Jul 2017 20:45:35 +0200
Subject: [Buildroot] [PATCH] libtomcrypt: bump to version 1.18.0-rc1
In-Reply-To: <20170706202526.365ec65c@windsurf.lan>
References: <20170706175456.11742-1-francois.perrad@gadz.org>
 <20170706202526.365ec65c@windsurf.lan>
Message-ID: <CAB0FRstL5wU2_8smT2LPx9Xv9uBhmJQNax_paLH=u4H43kGt_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-07-06 20:25 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Thu,  6 Jul 2017 19:54:56 +0200, Francois Perrad wrote:
>
> > -LIBTOMCRYPT_VERSION = 1.17
> > -LIBTOMCRYPT_SITE = https://github.com/libtom/
> libtomcrypt/releases/download/$(LIBTOMCRYPT_VERSION)
> > -LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.bz2
> > +LIBTOMCRYPT_VERSION = 1.18.0-rc1
>
> Why would we upgrade to a release candidate version?
>
>
It's a good way to test it (with autobuilder).
The dev of libtomcrypt is very slow, 1.17 was released on 25 Dec 2015.

Note: in BR, many packages use a Git hash commit as version/tag.

Fran?ois


> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170706/f5dfee5c/attachment.html>
