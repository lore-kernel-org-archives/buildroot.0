From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Mon, 30 Jul 2007 13:58:45 +0200
Subject: [Buildroot] Qtopia4 fails building - target stage tries to run
	target binaries	on build machine
Message-ID: <1185796725.27015.7.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to look into how to "fix" Qtopia 4 in Buildroot, at least it
does not compile for me (snapshot 20070717).

The makefile seems to generate target specific binaries in build_<arch>
directory, and host specific binaries in toolchain_build_<arch>.

As I understand the toolchain_build_<arch> binaries should be installed
to $(STAGING_DIR) and the build_<arch> binaries should be installed to
$(TARGET_ROOT)?

Have I understood the build setup correctly?

-- 
Regards
Hans-Christian Egtvedt
