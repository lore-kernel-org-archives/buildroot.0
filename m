From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 22:08:06 +0100
Subject: [Buildroot] [PATCH v1] package/sysvinit: add patch to fix
 compile without stack-protector support
In-Reply-To: <20210310220812.25726-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 10 Mar 2021 23:08:12 +0100")
References: <20210310220812.25726-1-ps.report@gmx.net>
Message-ID: <87wnu2ua15.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - add patch to remove '-fstack-protector-strong' compile flag
 > Fixes:
 >   .../aarch64-buildroot-linux-uclibc/bin/ld: runlevel.o: in function `main':
 >   runlevel.c:(.text.startup+0x4): undefined reference to `__stack_chk_guard'
 >   .../aarch64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
 >   .../aarch64-buildroot-linux-uclibc/bin/ld: cannot find -lssp

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
