From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun,  6 Oct 2013 20:13:12 +0200
Subject: [Buildroot] [PATCH 1/1] glib-networking: bump to version 2.36.2
Message-ID: <1381083192-24292-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/glib-networking/glib-networking.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 168e5ea..99fc591 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIB_NETWORKING_MAJOR_VERSION = 2.36
-GLIB_NETWORKING_MINOR_VERSION = 1
+GLIB_NETWORKING_MINOR_VERSION = 2
 GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_MAJOR_VERSION).$(GLIB_NETWORKING_MINOR_VERSION)
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_MAJOR_VERSION)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
-- 
1.7.9.5
