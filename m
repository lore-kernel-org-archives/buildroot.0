From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 4 Feb 2009 22:23:32 +0100
Subject: [Buildroot] uClibc-0.9.30-avr32-2.1.5.tar.bz2 is missing
References: <d6cda7730902041111h26b28bc7l4ab8f2fff3ef9e1c@mail.gmail.com>
Message-ID: <F5677F2913BF4E44A9D6D3B4D74FB21C@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
>
>    The avr32 configurations can't download
> uClibc-0.9.30-avr32-2.1.5.tar.bz2. The primary site
> (ftp://www.at91.com) gives Connection refused, and the buildroot
> mirror doesn't have it.
>    Same goes for binutils-2.18-avr32-1.0.1.tar.bz2
>
>    According to [1], avr32 support was in uClibc svn after 0.9.29
> release, so upstream 0.9.30 should have support to it. Unfortunally I
> don't see any easy way to work around this, disabling only the vendor
> specific uclibc while keeping it for the rest of the toolchain. If we
> remove the external source toolchain handling from uclibc.mk, it will
> affect versions prior to .30.
>
> [1] http://avr32linux.org/twiki/bin/view/Main/MicroClibcPatches
>
> Thanks,
>   Thiago A. Correa
>

I would say that this  is a temporary problem.
The whole www.at91.com site seems to be locked up.
ftp wont connect to the server to my usual account.
Will report this to the responsible persons.

If the AVR toolchain is mirrored on the Buldroot mirror, then it is possible
to set ATMEL_MIRROR to point at the mirror would work.

If you do not have the source tarballs, I can provide it to you,
if you can point to an ftp server where I can upload.

Could also move the stuff to sourceforge of course...

Best Regards
Ulf Samuelsson
