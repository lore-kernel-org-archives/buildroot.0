From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Feb 2009 10:15:27 +0100
Subject: [Buildroot] gcc compilation issues on AT91SAM9G20
In-Reply-To: <20090226151511.da1c9b65.william@brodie-tyrrell.org> (William
	Brodie-Tyrrell's message of "Thu\, 26 Feb 2009 15\:15\:11 +0900")
References: <20090225174424.09d0badc.william@brodie-tyrrell.org>
	<87iqmyoogi.fsf@macbook.be.48ers.dk>
	<20090225191212.c5a31f46.william@brodie-tyrrell.org>
	<8763iyom4z.fsf@macbook.be.48ers.dk>
	<20090226151511.da1c9b65.william@brodie-tyrrell.org>
Message-ID: <87hc2gmea8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "William" == William Brodie-Tyrrell <william@brodie-tyrrell.org> writes:

Hi,

 William> OK, so I'm trying to build the latest (downloaded SVN HEAD
 William> version last night) version of buildroot because v23434 (as
 William> indicated on linux4sam.org) doesn't want to build a native
 William> toolchain.

 William> The problem I'm having now is two-fold.  Firstly, the
 William> following line appears in my .config when I run make
 William> menuconfig: BR2_GCC_TARGET_ABI="aapcs-linux"

Are you trying an EABI or OABI build? The aapcs-linux stuff is for
EABI.

 William> thanks...

We don't have a defconfig for that specific board in BR, but I just
tried the at91sam9g20dfc defconfig where I added "native toolchain in
the target filesystem", and that builds without problems.

Could you post your .config?

-- 
Bye, Peter Korsgaard
