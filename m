From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  5 Mar 2016 17:23:57 +0100
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.8.0-4
Message-ID: <1457195037-21425-1-git-send-email-joerg.krause@embedded.rocks>
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
index 20aaffe..934ec15 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d5b21def19a5c411adaac3e817e2c7d3825d1062d8d0024b6ebd7a1f0a0a58d0  luv-1.8.0-0.tar.gz
+sha256  e1aef90bcd6993048102acd8260ca895fece49fbe6c03a4c22cf6c67eba68fb5  luv-1.8.0-4.tar.gz
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index c5648c5..69fabf8 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.8.0-0
+LUV_VERSION = 1.8.0-4
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.7.2
