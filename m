From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 24 Sep 2010 13:13:57 -0500
Subject: [Buildroot] Building a package for gdb debugging
Message-ID: <0D753D10438DA54287A00B027084269764451B9DB7@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I need to build a package for debugging a segfault with gdb.  Is there an
easy way to pass the -g switch so that gcc compiles the program with
debugging flags?  Also, how can I keep the final executable from being
stripped?

Thanks,
Hartley
