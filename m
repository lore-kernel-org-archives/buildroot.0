From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 25 Dec 2015 22:28:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.8.0
Message-ID: <1451078928-32387-1-git-send-email-joerg.krause@embedded.rocks>
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
index 31d29c7..20aaffe 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 7f558461225dd57fbc784cd8b4f7ec8270dd1c179e8bdce3f7009c835c828317  luv-1.7.4-5.tar.gz
+sha256 d5b21def19a5c411adaac3e817e2c7d3825d1062d8d0024b6ebd7a1f0a0a58d0  luv-1.8.0-0.tar.gz
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 85da7d1..c5648c5 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.7.4-5
+LUV_VERSION = 1.8.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.6.4
