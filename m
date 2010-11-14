From: Dan Engel <dengel@sourceharvest.com>
Date: Sun, 14 Nov 2010 00:28:10 -0500
Subject: [Buildroot] making buildroot for arm7tdmi static flat fails
Message-ID: <1289712490.19487.13.camel@cecilia.engel.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, all.

I'm trying to make buildroot for the arm7tdmi (toolchain only, no
busybox, kernel, etc.) on a basic x86 system, and I get this after a
while of building:

  LN include/sys/prctl.h
  LN include/sys/ptrace.h
  LN include/sys/timerfd.h
  LN include/sys/elf.h
  LN include/sys/io.h
  LN include/sys/procfs.h
  LN include/sys/ucontext.h
  LN include/sys/user.h
  AS lib/crt1.o
make[1]: *** No rule to make target `lib/crti.o'.  Stop.
make[1]: Leaving directory
`/mnt/local/arm_toolchain/build/buildroot-2010.08/output/toolchain/uClibc-0.9.31'
make: ***
[/mnt/local/arm_toolchain/build/buildroot-2010.08/output/toolchain/uClibc-0.9.31/.configured] Error 2

Has anyone seen this, or know what might be going on?

Of course, this is only the last part of the output. If this is not a
known issue with a known work-around, then I'll gladly send a follow-up
post with the entire make output (along with the buildroot and uclibc
configurations) attached.

What additional information can I provide, that would help anyone
willing to help me?

Thanks,
-Dan Engel
