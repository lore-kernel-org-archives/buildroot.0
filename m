From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon, 17 Mar 2008 17:29:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080318002913.ED1CB12C605@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-03-17 17:29:13 -0700 (Mon, 17 Mar 2008)
New Revision: 21375

Log:

Added .auto.deps to svn:ignore property (fixes issue 2574)


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
binaries
project_build_*
target_build_*
include

   + dl
.config
.config.cmd
.config.old
.auto.deps
config.*
build_*
toolchain_build_*
rootfs*
linux-kernel-*
binaries
project_build_*
target_build_*
include
