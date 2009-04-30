From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Apr 2009 12:07:57 +0200
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
In-Reply-To: <d6cda7730904292328h7a48188ao9012ae0dd5dda91e@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Thu\, 30 Apr 2009
	03\:28\:08 -0300")
References: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
	<20090430073104.684a701c@hcegtvedt.norway.atmel.com>
	<d6cda7730904292328h7a48188ao9012ae0dd5dda91e@mail.gmail.com>
Message-ID: <877i12bgjm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> Done. But I wonder if we should take more steps in this
 Thiago> regard. One thing is to have packages that don't build,
 Thiago> another is a package that builds but fails at run time with
 Thiago> known upstream bugs. Being the bootloader, it could brick
 Thiago> boards from unaware users without a JTAGICE mkII.

I would guess (hope?) that people don't blindly upgrade stuff that
could brick their boards.

Newertheless, we could add a warning in BR Kconfig for AVR32 if the
jffs2 stuff is selected and 2009.01 / 2009.03.

-- 
Bye, Peter Korsgaard
