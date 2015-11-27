From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 27 Nov 2015 20:53:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.7.4-5
Message-ID: <1448654004-2639-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 307fc19..31d29c7 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9ea1c2343e76f653f8e7d3420d2c7718ef4eca67a645a9d17297ae91caa224b5 luv-1.7.4-4.tar.gz
+sha256 7f558461225dd57fbc784cd8b4f7ec8270dd1c179e8bdce3f7009c835c828317  luv-1.7.4-5.tar.gz
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index a810c63..85da7d1 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.7.4-4
+LUV_VERSION = 1.7.4-5
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.6.2
