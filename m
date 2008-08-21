From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Aug 2008 15:10:41 +0200
Subject: [Buildroot] Package ace_of_penguins sets unneeded variable
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190966BE6A@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Wed\,
	13 Aug 2008 17\:05\:31 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE190966BE6A@mi8nycmail19.Mi8.com>
Message-ID: <87od3ma4z2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

 hartleys> Hello all,
 hartleys> The ace_of_penguins package sets:

 hartleys> ACE_OF_PENGUINS_CONF_OPT = --target=$(GNU_TARGET_NAME) \
 hartleys> 		--host=$(GNU_TARGET_NAME) --build=$(GNU_HOST_NAME) \
 hartleys> 		--prefix=/usr --sysconfdir=/etc

 hartleys> This appears to be unnecessary since Makefile.autotools.in sets those
 hartleys> automatically:

Thanks, fixed in trunk.

-- 
Bye, Peter Korsgaard
