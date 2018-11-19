From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:08:14 +0100
Subject: [Buildroot] [git commit] libtirpc: bump to version 1.1.4
Message-ID: <20181202071556.98C1C8843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a62fdaa49618568975b8b7b2fe1f7792e097eb35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 643a5d2050..eacc94d1de 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1 48adb32dc7c3b73c66f001c239da76b8398abf11  libtirpc-1.0.3.tar.bz2
+sha1 d85717035cb9bd6c45557a1eb1351d3af9a69ff7  libtirpc-1.1.4.tar.bz2
 # Locally computed
-sha256 86c3a78fc1bddefa96111dd233124c703b22a78884203c55c3e06b3be6a0fd5e  libtirpc-1.0.3.tar.bz2
+sha256 2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d  libtirpc-1.1.4.tar.bz2
 sha256 17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 36f9f7ef21..1e1905b713 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.0.3
+LIBTIRPC_VERSION = 1.1.4
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
