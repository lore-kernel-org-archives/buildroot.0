From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 25 Jul 2017 22:16:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/lcdapi: bump version to 0.11
Message-ID: <20170725201643.8611-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lcdapi/lcdapi.hash | 2 +-
 package/lcdapi/lcdapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lcdapi/lcdapi.hash b/package/lcdapi/lcdapi.hash
index 98c42f8f5..c04ea021f 100644
--- a/package/lcdapi/lcdapi.hash
+++ b/package/lcdapi/lcdapi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 fa26b53fd543ebab825d55cafb4c88af6a71ac3dcf86d4e8bcd3592be4212b55 lcdapi-v0.10.tar.gz
+sha256 6afdd4238af1fa7ea5f10378601381fc3f535a10504dc7d4ea8eab56e0dda091  lcdapi-v0.11.tar.gz
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index 453f4b9d0..f7c71dfd3 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCDAPI_VERSION = v0.10
+LCDAPI_VERSION = v0.11
 LCDAPI_SITE = $(call github,spdawson,lcdapi,$(LCDAPI_VERSION))
 LCDAPI_LICENSE = LGPL-2.1+
 LCDAPI_LICENSE_FILES = COPYING
-- 
2.11.0
