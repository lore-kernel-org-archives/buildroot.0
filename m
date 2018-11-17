From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 17 Nov 2018 20:48:55 +0100
Subject: [Buildroot] [PATCH 1/2] libtirpc: Bump to version 1.1.4
Message-ID: <20181117194856.29604-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
Add sha1 from sourceforge.

PS: Baruch, thx for info about hash location on sourceforge.
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
-- 
2.19.1
