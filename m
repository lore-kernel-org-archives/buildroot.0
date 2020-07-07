From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  7 Jul 2020 23:34:08 +0200
Subject: [Buildroot] [PATCH] package/libnspr: bump version to 4.26
Message-ID: <20200707213408.698324-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index cdbf6ce69d..2a89ca0b53 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.25/src/SHA256SUMS
-sha256	0bc309be21f91da4474c56df90415101c7f0c7c7cab2943cd943cd7896985256  nspr-4.25.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.26/src/SHA256SUMS
+sha256	fc9d142d85b74ffd2e6374a0c9016f3f2dac074225e24df3070e5a72d31b773d  nspr-4.26.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 857052d8c7..db8884ee65 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.25
+LIBNSPR_VERSION = 4.26
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.25.1
