From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 26 Jul 2020 02:53:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump version to 4.27
In-Reply-To: <20200726005333.340972-1-giulio.benetti@benettiengineering.com>
References: <20200726005333.340972-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200726005333.340972-2-giulio.benetti@benettiengineering.com>
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
index 2a89ca0b53..d6f87fd9a0 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.26/src/SHA256SUMS
-sha256	fc9d142d85b74ffd2e6374a0c9016f3f2dac074225e24df3070e5a72d31b773d  nspr-4.26.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.27/src/SHA256SUMS
+sha256	6d495192b6ab00a3c28db053492cf794329f7c0351a5728db198111a1816e89b  nspr-4.27.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index db8884ee65..8510d29e36 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.26
+LIBNSPR_VERSION = 4.27
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.25.1
