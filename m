From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 May 2017 23:30:42 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/cjson: bump version to v1.5.3
Message-ID: <20170523213042.4174-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 14853da2f..bc5fe213a 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 6d1482c1b492893b25ab7e77ee6098fe3ef10585df660e5ffe67e632a8c5b9e4  cjson-v1.5.2.tar.gz
+sha256 0fcf35ce2f28d8696f9cd92a0845d6210d981e2be4c6c6d55692fe3714e5b79b  cjson-v1.5.3.tar.gz
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index c0f4b98f2..a562eb2a3 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.5.2
+CJSON_VERSION = v1.5.3
 CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.11.0
