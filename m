From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Apr 2009 12:02:40 +0200
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
In-Reply-To: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 29 Apr 2009
	20\:55\:57 -0300")
References: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
Message-ID: <87fxfqbgsf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> Hi,
 Thiago>    The 2009.03 and possibly 2009.01 u-boot releases have a problem
 Thiago> with JFFS2. Looks like it's not really platform specific, but it
 Thiago> affects the AVR32 boards [1].
 Thiago>    Not sure if it's connected, but also flinfo presents wrong addresses.

 Thiago>    I'm seeing this with 2009.03, but the message[1] talks about 2009.01
 Thiago>    Is anyone else having these problems? I've just flashed 2008.10 and
 Thiago> it works properly.

I use 2009.03 without problems, but I don't use jffs2 (atleast not in
u-boot).

 Thiago>    Should we deal with 2009.03 and 2009.01 in any special way? (Drop
 Thiago> them, comment as broken JFFS2?)

Strange, it seems like that particular problem should have been fixed
by b5b004ad8a0ac6f98bd5708ec8b2 back in December, which is not in
2009.01, but IS in 2009.03.

So what you are seing, must be something else. Try bringing it up on
the u-boot list.

I would prefer to fix the problems in 2009.03 instead of letting
people use the old 2008.10 release, as the new releases have a lot of
bug fixes / new features.

-- 
Bye, Peter Korsgaard
