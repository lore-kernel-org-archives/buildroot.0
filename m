From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  1 Aug 2014 11:27:51 +0200
Subject: [Buildroot] [PATCH 1/1] atk: bump to version 2.12.0
Message-ID: <1406885271-21533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
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
index 9ccdd22..46a097d 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.10
+ATK_VERSION_MAJOR = 2.12
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-- 
1.7.9.5
