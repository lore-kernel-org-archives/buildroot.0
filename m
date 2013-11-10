From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 09:37:06 +0100
Subject: [Buildroot] [PATCH 1/1] openpgm: disable for AVR32,
	not its Buildroot-built toolchain
In-Reply-To: <1383916159-1551-1-git-send-email-alexander.lukichev@gmail.com>
 (Alexander Lukichev's message of "Fri, 8 Nov 2013 15:09:19 +0200")
References: <1383916159-1551-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <87li0wejpp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Lukichev <alexander.lukichev@gmail.com> writes:

 > OpenPGM builds incorrectly on AVR32 with gcc-4.2.2-avr32-2.1.5.
 > Since it is presumed to be the only GCC version used by Buildroot
 > for AVR32, this patch disables openpgm for all cases when AVR32
 > is selected as the target architecture, including when a toolchain
 > is downloaded or preinstalled (this is what Buildroot autobuilders
 > do).

Committed, thanks.

-- 
Bye, Peter Korsgaard
