From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Apr 2008 08:49:48 +0200
Subject: [Buildroot] Hi There
In-Reply-To: <013101c89a01$e94531d0$030514ac@atmel.com> (Ulf Samuelsson's
	message of "Wed\, 9 Apr 2008 06\:17\:09 +0200")
References: <200804081340.13053.buildroot.atmel.com@pollet.net>
	<877if8jvjh.fsf@macbook.be.48ers.dk>
	<012f01c899bf$242ab100$070514ac@atmel.com>
	<873apwggb0.fsf@macbook.be.48ers.dk>
	<013101c89a01$e94531d0$030514ac@atmel.com>
Message-ID: <87myo3froz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Talking about u-boot, what's the status of the avr32 patch? Can we
 >> bump the u-boot version to 1.3.2?

 Ulf> The AVR32 has been fully integrated into U-Boot for quite some time
 Ulf> and I think there should be no reason to give any special consideration
 Ulf> when bumping versions.

So we can get rid of
target/u-boot/u-boot-1.3.0-avr32-100-atmel.2.patch ? Great!

 Ulf> It might be good to allow for several versions of U-Boot though,
 Ulf> if some release do break a board or architecture.

Sure, to a certain limit.

 Ulf> I hope the situation will stabilize and that the AT91 stuff can
 Ulf> be merged in mainstream buildroot during the summer.

Good to hear.

-- 
Bye, Peter Korsgaard
