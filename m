From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Mar 2016 20:43:44 -0300
Subject: [Buildroot] [PATCH 1/2] glib-networking: bump to version 2.48.0
Message-ID: <1458603825-2722-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 22518ce..7b22592 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.46/glib-networking-2.46.1.sha256sum
-sha256	d5034214217f705891b6c9e719cc2c583c870bfcfdc454ebbb5e5e8940ac90b1	glib-networking-2.46.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.48/glib-networking-2.48.0.sha256sum
+sha256	7a1f3312e757b97af94e2db8a1f14eb9cc018c983931ecdf3b0c54acece39024	glib-networking-2.48.0.tar.xz
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index b7b92c6..a568321 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.46
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
+GLIB_NETWORKING_VERSION_MAJOR = 2.48
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
-- 
2.7.3
