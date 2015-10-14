From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 14:04:08 -0300
Subject: [Buildroot] [PATCH 2/5] glib-networking: bump to version 2.46.1
In-Reply-To: <1444842251-4913-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444842251-4913-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1444842251-4913-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 2 +-
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
-- 
2.4.9
