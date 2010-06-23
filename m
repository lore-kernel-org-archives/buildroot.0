From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jun 2010 17:48:12 +0200
Subject: [Buildroot] [PATCH] Fix u-boot 2010.03 build for AVR32
In-Reply-To: <AANLkTinrP9FwGkXeMMHMhI4Z2Y6bmS3kv9EOJm6nBtPH@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed, 23 Jun 2010
	12:44:51 -0300")
References: <AANLkTinrP9FwGkXeMMHMhI4Z2Y6bmS3kv9EOJm6nBtPH@mail.gmail.com>
Message-ID: <87iq59698j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hi,
 Thiago>     The following patch fixes the "error: asm/unaligned.h: No such
 Thiago> file or directory" while building u-boot for avr32.

Thanks. Did you intend to make those changes in
target/device/Atmel/Makefile.in? If so, please describe in the commit
message why. 

-- 
Bye, Peter Korsgaard
