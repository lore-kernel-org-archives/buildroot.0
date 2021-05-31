From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 31 May 2021 12:29:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump version to 4.31
In-Reply-To: <20210531102947.7501-1-giulio.benetti@benettiengineering.com>
References: <20210531102947.7501-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210531102947.7501-2-giulio.benetti@benettiengineering.com>
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
index 8ca0f573b9..aaf9b1dff2 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.30/src/SHA256SUMS
-sha256  8d4cd8f8409484dc4c3d31e180354bfc506573eccf86cd691106a1ef7edc913b  nspr-4.30.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.31/src/SHA256SUMS
+sha256  5729da87d5fbf1584b72840751e0c6f329b5d541850cacd1b61652c95015abc8  nspr-4.31.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 67fb738b57..f78caea30b 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.30
+LIBNSPR_VERSION = 4.31
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.25.1
