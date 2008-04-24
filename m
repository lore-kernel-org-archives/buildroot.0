From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 02:03:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20080424090320.0BA6F3C7D8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-24 02:03:19 -0700 (Thu, 24 Apr 2008)
New Revision: 21822

Log:
strace: use .patch.$ARCH naming convention


Added:
   trunk/buildroot/package/strace/strace-arch.patch.avr32
   trunk/buildroot/package/strace/strace-autoreconf.patch.avr32
   trunk/buildroot/package/strace/strace-undef-syscall.patch.avr32

Removed:
   trunk/buildroot/package/strace/strace-autoreconf.patch
   trunk/buildroot/package/strace/strace-avr32.patch
   trunk/buildroot/package/strace/strace-undef-syscall.patch

Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:

Sorry, the patch is too large to include (26582 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21822
