From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 7 May 2008 13:12:40 +0200
Subject: [Buildroot] Latest AVR32 toolchain sources uploaded tp
	BR2_ATMEL_MIRROR
References: <d6cda7730805051134j245a8687o66eaa6fc9d3c93ae@mail.gmail.com><013a01c8aef9$5aa98d10$070514ac@atmel.com><d6cda7730805051634p6bb3a5c4mb9e584e6059cb693@mail.gmail.com><008a01c8af69$7d5d1be0$5e8d910a@atmel.com>
	<d6cda7730805060808g5aa7d98am3e29c421e88345a@mail.gmail.com>
Message-ID: <054501c8b03c$38a409e0$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I uploaded 

avr32-gcc-4.2.2.atmel.1.0.8.tar.gz      ==> gcc-4.2.2-avr32-1.0.8.tar.bz2
avr32-binutils-2.17.atmel.1.2.6.tar.gz  ==> binutils-2.17-avr32-2.1.4.tar.bz2
avr32-gdb-6.7.1.atmel.1.0.3.tar.bz2    ==> gdb-6.7.1-avr32-1.0.3.tar.bz2

to $(BR2_ATMEL_MIRROR) = ftp://www.at91.com/pub/buildroot today.

Since I can download from this mirror at 40 Mbit/s I doubt
that a new mirror is needed for download speed purposes.

If someone wants to set up another alternative mirror to
allow write access to anyone, then It is not hard to 
fix so that the user can select a mirror from a list of mirrors.

Best Regards
Ulf Samuelsson
