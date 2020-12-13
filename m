From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Dec 2020 23:38:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: bump to version
 2.66.0
Message-ID: <20201213223838.918049-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://gitlab.gnome.org/GNOME/glib-networking/-/blob/2.66.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 336e0aa07b..976a19f25e 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.64/glib-networking-2.64.3.sha256sum
-sha256  937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168  glib-networking-2.64.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.66/glib-networking-2.66.0.sha256sum
+sha256  c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099  glib-networking-2.66.0.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 295c7516cc..743053390f 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.64
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).3
+GLIB_NETWORKING_VERSION_MAJOR = 2.66
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
-- 
2.29.2
