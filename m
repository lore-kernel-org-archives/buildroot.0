From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  4 Oct 2018 06:42:58 +0200
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.22.0-1
Message-ID: <20181004044258.22368-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luv/luv.hash | 3 ++-
 package/luv/luv.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 44f4048df3..24440bef8e 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1051cfbdc361d5ea6d978fd71273b94c8a5007d76af498b456b297b18de9622c  luv-1.9.1-1.tar.gz
+sha256 27886acb3d3f531a3d6ca70360d2593ddf1a8d4daf94ca3beea14d9381227ff7  luv-1.22.0-1.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 633bfe6890..87158b72ed 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.9.1-1
+LUV_VERSION = 1.22.0-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.19.0
