From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Mar 2021 22:58:28 +0100
Subject: [Buildroot] [PATCH v1] package/bison: bump version to 3.7.6
Message-ID: <20210312215828.28390-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update COPYING file hash (URL update from http to https)

For details see [1].

[1] https://fossies.org/linux/bison/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bison/bison.hash | 7 ++++---
 package/bison/bison.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index 123b6100c4..f4abe4c661 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  55c215521a13982a9bee68cd42eed51a65713f96c530a739a57de4438ac1bb69  bison-3.7.1.tar.xz
+# Locally calculated after checking pgp signature from
+# http://mirror.keystealth.org/gnu/bison/bison-3.7.6.tar.xz.sig
+sha256  67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf  bison-3.7.6.tar.xz
 # License files, locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index efd75afd66..26db307e20 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.7.1
+BISON_VERSION = 3.7.6
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
-- 
2.30.1
