From: =?UTF-8?Q?Zden=C4=9Bk_Materna?= <zdenek.materna@gmail.com>
Date: Fri, 18 Feb 2011 14:37:48 +0100
Subject: [Buildroot] Problem with gmp library
In-Reply-To: <AANLkTimDr-hb4wUZBG+tqavQyDhiRZJ791n==JgbmU+w@mail.gmail.com>
References: <AANLkTimDr-hb4wUZBG+tqavQyDhiRZJ791n==JgbmU+w@mail.gmail.com>
Message-ID: <AANLkTikFLQ8AdekPMkaZzEUFJPxb22W2FmZaoBkfSYcS@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is Buildroot's .config, and config.log of mpfr and gmp. I'm sorry for
another mail - forgot to attach link in previous one.

http://sestka.zlutaponorka.com/zd/logs.zip

Zdenek

Dne 18. ?nora 2011 14:30 Zden?k Materna <zdenek.materna@gmail.com>napsal(a):

> Hello everyone,
>
> how are you? I'm new to this list.
>
> What's my problem? I would like to build toolchain, rootfs and kernel for
> Olimex kit SAM9-L9260 with Buildroot 2010.11, but I get this error:
>
> checking for __gmpz_init in -lgmp... no
> configure: error: libgmp not found or uses a different ABI.
> Please read the INSTALL file -- see "In case of problem".
> make: *** [/home/zdenal/Dokumenty/fekt/
>  diplomka/buildroot/buildroot-2010.11/output/build/mpfr-2.4.1/.configured]
> Error 1
>
> I tryed different configurations (gmp/mpfr enabled and disabled, more
> versions of uclibc/gcc) and it's always the same. It is strange because not
> so far I was able to build it and I don't know what's different now in
> config. I also try depclean and bright new configuration. With same result.
> Googling didn't help.
>
> Thanks a lot for any advice!
>
> Zdenek Materna
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110218/9195e78b/attachment.html>
