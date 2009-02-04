From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Feb 2009 08:39:48 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 3 Feb 2009
	23\:49\:10 -0200")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
Message-ID: <87bptiejln.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hi,
 Thiago>     I thought it was seattled sometime last year that kernel names
 Thiago> would not include timestamps or any think that breaks u-boot from
 Thiago> loading the kernel.

I thought so as well.

 Thiago>     I just had atngw100-linux-2.6.27.13-20090203.gz for a kernel name.
 Thiago> It's already bad enough that rootfs has stupid timestamps, we don't
 Thiago> really need kernel binaries too. If I wanted to preserve binaries, I
 Thiago> would copy them over before building again. Whenever I type make, I
 Thiago> expect things to be overwritten.
 Thiago>     As I develop a system, I don't want to find out that I'm out of
 Thiago> disk space because it has every single failed attempt in binaries
 Thiago> folder. I also don't want to touch u-boot in anyway, don't care if
 Thiago> there are autoscripts or not. Ideally it would be named uImage like
 Thiago> the kernel folks intended.

 Thiago>     Peter, could we hear your opinion on this? At least let's make
 Thiago> this optional and never bother with it again.

I agree. I'll look closer into it.

-- 
Bye, Peter Korsgaard
