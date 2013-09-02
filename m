From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon,  2 Sep 2013 10:40:49 +0200
Subject: [Buildroot] [PATCH 1/1] atk: bump to version 2.9.4
Message-ID: <1378111249-25241-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/atk/atk.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index ecfec54..433e1e3 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATK_VERSION_MAJOR = 2.9
-ATK_VERSION = $(ATK_VERSION_MAJOR).3
+ATK_VERSION = $(ATK_VERSION_MAJOR).4
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
 ATK_LICENSE = LGPLv2+
-- 
1.7.9.5
