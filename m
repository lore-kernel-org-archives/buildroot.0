From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Feb 2009 14:23:41 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Thu\, 5 Feb 2009
	00\:33\:10 -0200")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<d6cda7730902041833r5e5af2ax26c0eebb48df19a4@mail.gmail.com>
Message-ID: <87vdrpaug2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hi,
 >> To me the sane thing would just be for the files to be named whatever
 >> the kernel names them (uImage/zImage/bzImage/..), but even if we don't
 >> do that we should atleast make the 2 Linux types use the same style.
 >> 

 Thiago> Unless someone oposes, I will commit the patch below tomorrow night.

Please do it today, I'm planning on cutting the release tomorrow
(Friday) at noon.

 Thiago> It will use the rootfs suffix if one is specified for the kernel, but
 Thiago> if none is supplied, we get default kernel names. Then you can get
 Thiago> both rootfs and kernel with your board names, dates, etc. And both
 Thiago> rootfs and kernel names will always match.

Seems good, but don't forget the non-advanced version as well. We
should imho use the same naming convention for both kernel builds.

-- 
Bye, Peter Korsgaard
