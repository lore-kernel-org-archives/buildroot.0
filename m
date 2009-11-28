From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Nov 2009 11:45:43 +0100
Subject: [Buildroot] Build jobbing
In-Reply-To: <200911271610.08010.minimod@morethan.org> (Michael S. Zick's
	message of "Fri\, 27 Nov 2009 16\:10\:05 -0600")
References: <200911271522.58858.minimod@morethan.org>
	<877htb638c.fsf@macbook.be.48ers.dk>
	<200911271610.08010.minimod@morethan.org>
Message-ID: <87y6lr3p2g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 Michael> ltrace does not build - just disabled it for now.

It builds here:

build/ltrace-0.5/ltrace: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), not stripped

What exactly goes wrong?

 Michael> mii-diag-2.11 does not build - just disable it for now.

It builds here:

build/mii-diag-2.11/mii-diag: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), not stripped

What exactly goes wrong?

 Michael> nand_{erase,lock,unlock) in BB-1.15.2 does not build.

There's a busybox patch pending for building the flash stuff with
2.6.31.x kernel headers. I'll do a bit more testing and commit.

-- 
Bye, Peter Korsgaard
