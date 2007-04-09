From: mark roths <mroths@gmail.com>
Date: Mon, 9 Apr 2007 15:07:39 -0700
Subject: [Buildroot] arm compile problem around multi-cpu stuff
Message-ID: <cd7850860704091507t6d0e1d46s329828870aa429d0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build a recent (uclibc9.28.3 based) rfs using one of the
latest buildroot snapshots.  All are failing
to compile ./build_arm/busybox-1.5.0/miscutils/taskset.c

cpu_set_t is used but nowhere defined.  In addition there are lots of
undefined macros e.g. CPU_SETSIZE()
that also create errors.

Any help appreciated.

Mark Roths
Softair Microsystems
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070409/8d626c02/attachment.htm 
