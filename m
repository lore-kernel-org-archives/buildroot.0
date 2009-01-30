From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 11:23:01 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <1233310475.6293.20.camel@sven> (Sven Neumann's message of "Fri\,
	30 Jan 2009 11\:14\:35 +0100")
References: <1233243053.15375.33.camel@sven>
	<87eiymru7j.fsf@macbook.be.48ers.dk> <1233309685.6293.17.camel@sven>
	<1233310475.6293.20.camel@sven>
Message-ID: <8763jxnldm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

Hi,

 Sven> Might be related to
 Sven> http://gcc.gnu.org/ml/gcc-patches/2008-09/msg01500.html

Ahh, our good friend Bernhard ;)

 Sven> BR2_GCC_TARGET_ABI="aapcs" seems to be accepted. I will try to compile
 Sven> my tree with this option now and also check if I can build a recent
 Sven> kernel using the compiler that results from this build...

Ok, thanks, otherwise I'll take the gcc patch so aapcs-linux works.

-- 
Bye, Peter Korsgaard
