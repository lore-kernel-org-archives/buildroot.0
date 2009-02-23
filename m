From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 10:10:41 +0100
Subject: [Buildroot] Toolchain error
In-Reply-To: <1E3D081C7B502B4A988F643E604CF9634721AD@INDEXCH.corp.proxim.com>
	(Rajeev Bansal's message of "Sat\, 21 Feb 2009 22\:44\:29 -0800")
References: <1E3D081C7B502B4A988F643E604CF9634721AD@INDEXCH.corp.proxim.com>
Message-ID: <873ae54iy6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rajeev" == Rajeev Bansal <rbansal@proxim.com> writes:

 Rajeev> Hi All,

 Rajeev> This is my first experience with the Buildroot, I have used
 Rajeev> the latest stable version "buildroot-2009.02.tar.bz2 to build
 Rajeev> the MIPS cross-toolchain. During building of toolchain I got
 Rajeev> the following error

You selected Native POSIX Threading (NPTL) for pthread instead of the
default linuxthreads old. NPTL isn't available for mips yet, so change
it back and the build will work.

-- 
Bye, Peter Korsgaard
