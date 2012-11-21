From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Nov 2012 11:15:02 +0100
Subject: [Buildroot] [PATCH 2/3] xtensa: fix target gdb build and 64-bit
	host side gdb
In-Reply-To: <50ac8f62.a3c9440a.59e4.fffff6d9@mx.google.com> (Chris Zankel's
 message of "Tue, 20 Nov 2012 10:43:59 -0800")
References: <50ac8f62.a3c9440a.59e4.fffff6d9@mx.google.com>
Message-ID: <87k3tfi7o9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Zankel <chris@zankel.net> writes:

 Chris> Fix build breakage, use the version of the ptrace header file in asm
 Chris> instead of sys. Also, fix GDB running on 64 bit hosts. GDB was using
 Chris> unsigned long for 32-bit registers, but unsigned long is 64 bit on
 Chris> 64-bit hosts.

Committed, thanks.

-- 
Bye, Peter Korsgaard
