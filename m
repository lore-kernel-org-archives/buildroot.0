From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Jan 2011 23:01:17 +0100
Subject: [Buildroot] [PATCH 1/6] binutils: make it a proper package
In-Reply-To: <1293795546-19674-4-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 31 Dec 2010 08:39:01 -0300")
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
	<1293795546-19674-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8739pbdkya.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> * Convert binutils to a proper autotargets package
 Gustavo> * Add version 2.21 and drop version 2.17

 Gustavo> * Hook up packaged binutils for target gcc

 Gustavo> * Build tools are on HOST_DIR now so change it

 Gustavo> * Move cross/host gcc to HOST_DIR

 Gustavo> * Drop kludge from commit 3c77bab2eeace3ee675bd745ca335fa3dd1630bb
 Gustavo>   This is fixed in the next commit "gcc: install copies of libgcc,
 Gustavo>   libstdc++ and libgcj to the sysroot" - tested for arm & x86_64
 Gustavo>   targets.

 Gustavo> * TARGET_CROSS now pointed to HOST_DIR too

Committed with small changes to Config.in, thanks!

-- 
Bye, Peter Korsgaard
