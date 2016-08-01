From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  1 Aug 2016 22:09:49 +0200
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.9.1-0
Message-ID: <20160801200950.14966-1-joerg.krause@embedded.rocks>
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
index 8c5bbe3..140fe96 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6d49b899671236d9452c0bb95ea4a0c28aac13a959b9e87347241bc974ddd40b  luv-1.9.0-3.tar.gz
+sha256  2eab80360f8ab6793612bb59d067a56664ac9a5a14988e0a09a53d0bff20c131  luv-1.9.1-0.tar.gz
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 58686ee..43cecf5 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.9.0-3
+LUV_VERSION = 1.9.1-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.9.2
