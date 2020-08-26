From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 27 Aug 2020 01:25:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump version to 4.28
In-Reply-To: <20200826232542.920792-1-giulio.benetti@benettiengineering.com>
References: <20200826232542.920792-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200826232542.920792-2-giulio.benetti@benettiengineering.com>
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
index 3889a00d07..ec3d783503 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.27/src/SHA256SUMS
-sha256  6d495192b6ab00a3c28db053492cf794329f7c0351a5728db198111a1816e89b  nspr-4.27.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.28/src/SHA256SUMS
+sha256  63defc8e19a80b6f98fcc7d5a89e84ea703c0b50aa6bc13bf7ad071adf433b56  nspr-4.28.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 8510d29e36..f43811d5d1 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.27
+LIBNSPR_VERSION = 4.28
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.25.1
