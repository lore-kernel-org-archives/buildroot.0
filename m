From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 29 Sep 2016 20:22:47 +0200
Subject: [Buildroot] uclibc-ng: bump to 1.0.18
In-Reply-To: <48e09c43-e43d-f67f-c6cb-b640c367ab5a@gmail.com>
References: <48e09c43-e43d-f67f-c6cb-b640c367ab5a@gmail.com>
Message-ID: <20160929182247.GK1947@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lance,
Lance Fredrickson wrote,

> I've been anticipating uclibc-ng 1.0.18 since it follows musl's lead and put
> everything (librt, libdl, pthread etc) into libc.
> On a previous release of buildroot I tried changing to 1.0.18 and it stops
> in the build.  I also just tried a fresh clone of Master and come upon the
> same error.
> 
> make[1]: Entering directory
> '/home/lance/buildroot/output/build/uclibc-1.0.18/utils'
>   HOSTCC utils/locale.host
> ../extra/locale/programs/locale.c:35:32: fatal error: bits/uClibc_locale.h:
> No such file or directory
>  #include <bits/uClibc_locale.h>
>                                 ^
> compilation terminated.
> Makefile.in:113: recipe for target '../utils/locale.host' failed
> 

It is fixed upstream and a patch was sent to br mailinglist.

I enabled the locale utility for target testing while playing with
uClibc-ng locale support, but haven't recognized that buildroot
als build all utils host variants.

:)

 best regards
  Waldemar
