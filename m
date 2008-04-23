From: <bogus@does.not.exist.com>
Date: Wed, 23 Apr 2008 14:39:25 -0000
Subject: No subject
Message-ID: <mailman.1.1210030477.1342.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

./arch-arm/kernel-patches-2.6.24/linux-2.6.24-at91.patch
./arch-arm/kernel-patches-2.6.20.4/linux-2.6.20.4-atmel.patch
./arch-arm/kernel-patches-2.6.21.1/linux-2.6.21.1-at91.patch
./arch-arm/kernel-patches-2.6.21.1/linux-2.6.21.1-at91-1-update.patch
./arch-arm/kernel-patches-2.6.21.5/linux-2.6.21.5-at91-1-update.patch
./arch-arm/kernel-patches-2.6.21.5/linux-2.6.21.5-at91.patch

Not to mention having a separate u-boot, just because the Atmel ARM
didn't get to get their patches upstream, while AVR32 did.

>  > On top of that, external toolchain tries to download prepatched
>  > toochain from a site that you control, but that has no such files to
>  > download from.
>
>  BR2_ATMEL_MIRROR should be ftp://www.at91.com/pub/buildroot/
>  I see the files in this location.

There is no gcc 4.2.2 in there. There is no gdb-4.7.1 in there.

>  > Please revert your changes asap.
>  >
>
>  No, if there are problems, it should be fixed within the external toolchain
>  to avoid adding those megabytes, which are of no interest to AVR32 users.
>  There are hooks to patch the external toolchain if neccessary.

Then I guess we will all be getting FTP user accounts to your server
now? So that we can fix things within the external toolchain?
I'm interested in those few kb (namely 915826 bytes). Last time I
checked, I was in the universe of AVR32 users.

You didn't even care to test your changes, and despite protests
removed the toolchain support anyway. You are taking away our freedom
to update, fix, do whatever with the toolchain from within buildroot.
Not to mention breaking things up and making me and a hell lot of
other people lose their day's or week's work.
Please revert your changes asap.

Regards,
   Thiago A. Correa
