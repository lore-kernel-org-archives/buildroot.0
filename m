From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 21 Mar 2021 08:59:30 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump version to 4.30
In-Reply-To: <20210321075931.3404471-1-giulio.benetti@benettiengineering.com>
References: <20210321075931.3404471-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210321075931.3404471-2-giulio.benetti@benettiengineering.com>
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
index f8f8fa76b9..8ca0f573b9 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.29/src/SHA256SUMS
-sha256  22286bdb8059d74632cc7c2865c139e63953ecfb33bf4362ab58827e86e92582  nspr-4.29.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.30/src/SHA256SUMS
+sha256  8d4cd8f8409484dc4c3d31e180354bfc506573eccf86cd691106a1ef7edc913b  nspr-4.30.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 6f072cb6d2..67fb738b57 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.29
+LIBNSPR_VERSION = 4.30
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.25.1
