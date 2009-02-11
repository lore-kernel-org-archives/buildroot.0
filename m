From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Feb 2009 21:15:34 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <1234382611.22044.8.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Wed\, 11 Feb 2009 21\:03\:31 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
	<874oz27iry.fsf@macbook.be.48ers.dk>
	<078a01c98b68$c18b47c0$f53018ac@Glamdring>
	<87ab8u5ub5.fsf@macbook.be.48ers.dk>
	<083a01c98b86$99d10260$f53018ac@Glamdring>
	<d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com>
	<d6cda7730902100917o3aee167fg2ae06ca5e3e402ba@mail.gmail.com>
	<08b701c98ba7$906b24f0$f53018ac@Glamdring>
	<d6cda7730902101048w1706b7e9j41d8702d50766756@mail.gmail.com>
	<1234382611.22044.8.camel@elrond.atmel.com>
Message-ID: <87zlgsg26x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Just for fun, I checked my OpenSuSE /boot directory

 Ulf> Guess what I found:

 Ulf> "vmlinuz" which happens to be a LINK to

 Ulf> ??vmlinuz-$(KERNEL_VERSION)-$(REV)-$PROJECT)
 Ulf> ?
 Ulf> There was also a:
 Ulf> vmlinux-$(KERNEL_VERSION)-$(REV)-$PROJECT).gz file

 Ulf> Looks like the guys doing OpenSuSE are as "odd" as I am.

And guess what the kernel outputs? A simple arch/x86/boot/bzImage, as
platform/distribution specific naming convention doesn't belong in the
mainline kernel.

-- 
Bye, Peter Korsgaard
