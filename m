From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Feb 2009 13:47:22 +0100
Subject: [Buildroot] Move BR2_ROOTFS_SUFFIX to Target filesystem options.
In-Reply-To: <d6cda7730902031753n680935f0j7901d6b96b02fcff@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 3 Feb 2009
	23\:53\:09 -0200")
References: <d6cda7730902031753n680935f0j7901d6b96b02fcff@mail.gmail.com>
Message-ID: <87y6wmcqsl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> Hi,
 Thiago>     It doesn't make sense to me to have it under "Build options", I
 Thiago> think it would be better to have "Custom root fs suffix" in the
 Thiago> "Target filesystem options" menu. That's where the other rootfs naming
 Thiago> options are.

 Thiago>     Could we move it? (Preferably before release?)

Done (r25234).

-- 
Bye, Peter Korsgaard
