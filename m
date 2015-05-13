From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 May 2015 09:31:26 +0300
Subject: [Buildroot] [PATCH 1/2] libmodbus: update download location
Message-ID: <5f820f3049a52d079c5900368eef6f4f7ba14a25.1431498687.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Saves one HTTP 301 redirection.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libmodbus/libmodbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index cf3735907e49..1f8c7303623c 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMODBUS_VERSION = 3.0.6
-LIBMODBUS_SITE = http://libmodbus.org/site_media/build
+LIBMODBUS_SITE = http://libmodbus.org/releases
 LIBMODBUS_LICENSE = LGPLv2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
 LIBMODBUS_INSTALL_STAGING = YES
-- 
2.1.4
