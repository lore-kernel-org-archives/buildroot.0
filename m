From: =?UTF-8?Q?Zden=C4=9Bk_Materna?= <zdenek.materna@gmail.com>
Date: Fri, 18 Feb 2011 14:30:28 +0100
Subject: [Buildroot] Problem with gmp library
Message-ID: <AANLkTimDr-hb4wUZBG+tqavQyDhiRZJ791n==JgbmU+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

how are you? I'm new to this list.

What's my problem? I would like to build toolchain, rootfs and kernel for
Olimex kit SAM9-L9260 with Buildroot 2010.11, but I get this error:

checking for __gmpz_init in -lgmp... no
configure: error: libgmp not found or uses a different ABI.
Please read the INSTALL file -- see "In case of problem".
make: *** [/home/zdenal/Dokumenty/fekt/
diplomka/buildroot/buildroot-2010.11/output/build/mpfr-2.4.1/.configured]
Error 1

I tryed different configurations (gmp/mpfr enabled and disabled, more
versions of uclibc/gcc) and it's always the same. It is strange because not
so far I was able to build it and I don't know what's different now in
config. I also try depclean and bright new configuration. With same result.
Googling didn't help.

Thanks a lot for any advice!

Zdenek Materna
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110218/d698a0b0/attachment.html>
