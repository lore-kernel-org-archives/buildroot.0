From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:59:38 +0200
Subject: [Buildroot] [git commit] package/libtirpc: bump to version 1.2.6
Message-ID: <20200415204813.C484A8ED97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=841df4966045dd4a3f136905f3aef2784f2f6fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes build on riscv64:

http://autobuild.buildroot.net/results/a334f774e95fb7805568fc3868d5cf1d790a6e73
http://autobuild.buildroot.net/results/9cf80bdd4d329788c89596b56205ef215ee09c35

There is also a fix for build with -fno-common (default for gcc-10)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index a7907dc7b2..e437554285 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1 ab80619b214d93e5cfbf22a0d01e1ee06d434326  libtirpc-1.2.5.tar.bz2
+sha1 f182235e32942fc0ac6b9b5b6fe7e32f69362659  libtirpc-1.2.6.tar.bz2
 # Locally computed
-sha256 f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca  libtirpc-1.2.5.tar.bz2
+sha256 4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc  libtirpc-1.2.6.tar.bz2
 sha256 17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 879b21e665..f1bdc32eba 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.2.5
+LIBTIRPC_VERSION = 1.2.6
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
