From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:28:05 +0200
Subject: [Buildroot] [git commit] glib-networking: bump to version 2.46.1
Message-ID: <20151014202845.B82AC818A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd87117a5c672373a4baea3a10b6b06959f3d5dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glib-networking/glib-networking.hash |    4 ++--
 package/glib-networking/glib-networking.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 6ebe625..22518ce 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.46/glib-networking-2.46.0.sha256sum
-sha256	3655526d6dbfc697c22cd9b279e14599f8449f5802b12d84485bdc52d96482f0	glib-networking-2.46.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.46/glib-networking-2.46.1.sha256sum
+sha256	d5034214217f705891b6c9e719cc2c583c870bfcfdc454ebbb5e5e8940ac90b1	glib-networking-2.46.1.tar.xz
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 67a9203..b7b92c6 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIB_NETWORKING_VERSION_MAJOR = 2.46
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
