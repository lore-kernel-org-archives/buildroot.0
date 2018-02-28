From: A <aaron.biver@gmail.com>
Date: Wed, 28 Feb 2018 09:13:54 -0500
Subject: [Buildroot] Xilinx-specific files not present in offline build
Message-ID: <CAMd7AX_ChKxJPAyhS9WeOP=AB0upLQ5COkQ-MYw6mg63GX3knQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm attempting an offline build, dowloading sources on a cygwin system with
internet, and copying the dl/* files to the redhat system without internet.

My most recent issue is the "make" on the build system appears to make some
progress, then eventually fails due to missing xilinx header files.

Any advice for things to check, or more information that would be helpful
to diagnose?

  INSTALL include/linux/isdn (1 file)
  INSTALL include/linux/mmc (1 file)
./scripts/Makefile.headersinst:55: *** Missing UAPI file
./include/uapi/linux/netfilter/xt_CONNMARK.h.  Stop.
make[4]: *** [netfilter] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180228/e09bdb1e/attachment.html>
