From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  8 Jul 2007 21:29:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070709042937.7E9D330046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-08 21:29:35 -0700 (Sun, 08 Jul 2007)
New Revision: 19049

Log:
Ignore some more build directories

Modified:
   trunk/buildroot/


Changeset:

Property changes on: trunk/buildroot
___________________________________________________________________
Name: svn:ignore
   - dl
.config
.config.cmd
.config.old
config.*
build_*
toolchain_build_*
rootfs*
linux-kernel-*

   + dl
.config
.config.cmd
.config.old
config.*
build_*
toolchain_build_*
rootfs*
linux-kernel-*
binaries
project_build_*
target_build_*
