From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 May 2014 10:18:41 +0200
Subject: [Buildroot] [PATCHv2 00/10] musl support,
	internal and external backends
In-Reply-To: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 5 May 2014 23:17:00 +0200")
References: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnvbgw0u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This patch series does two things:

 >  * Adds the musl support in the internal toolchain backend.

 >  * Adds a set of pre-built musl toolchains to the external toolchain
 >    backend.

 > Compared to v1:

 >  * The issue of the symbolic link for the dynamic linker noticed by
 >    Peter is fixed. In fact, the musl Makefile can create this symbolic
 >    link perfectly fine if we are in the good conditions.

 >  * A patch for musl support in gcc 4.9.0 has been added.

 >  * The patch for musl external toolchains has been added, and after
 >    the suggestion from Arnout, a single Kconfig option is now used
 >    instead of one per architecture.

 > I've built and boot tested under Qemu ARM/musl/gcc4.8 and
 > i386/musl/gcc4.9.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
