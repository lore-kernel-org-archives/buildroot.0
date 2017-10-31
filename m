From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Oct 2017 14:03:57 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.43.7
Message-ID: <9145cf92a7269ecb9b3e29d9702ad4c0a1e328c5.1509451437.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license files hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/e2fsprogs/e2fsprogs.hash | 8 ++++++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 2c29b853e0c7..cd839fb68011 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,2 +1,6 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.6/sha256sums.asc
-sha256 c9b226234ee878a8d89951f3b155cec7416dd0ec09c932c855f1b1df8ad93402  e2fsprogs-1.43.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.7/sha256sums.asc
+sha256 2a6367289047d68d9ba6a46cf89ab9a1efd0556cde02a51ebaf414ff51edded9  e2fsprogs-1.43.7.tar.xz
+# Locally calculated
+sha256 680f852df303874fe9c722283a7da571ae9a0477768df8af1e363298e2adc51e  NOTICE
+sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
+sha256 47182fe6631a32f271a15bbe210751b3825b7199f588879aac7d4804fc8b4b8f  lib/et/internal.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 59499bc2c9a8..be03a88ce8c1 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.43.6
+E2FSPROGS_VERSION = 1.43.7
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.14.2
