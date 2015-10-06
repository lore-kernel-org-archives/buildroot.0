From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Oct 2015 08:31:24 -0300
Subject: [Buildroot] [PATCH 2/2] glib-networking: bump to version 2.46.0
In-Reply-To: <1444131084-20328-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444131084-20328-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1444131084-20328-2-git-send-email-gustavo@zacarias.com.ar>
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
index 03ed3ae..6ebe625 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.44/glib-networking-2.44.0.sha256sum
-sha256	8f8a340d3ba99bfdef38b653da929652ea6640e27969d29f7ac51fbbe11a4346	glib-networking-2.44.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.46/glib-networking-2.46.0.sha256sum
+sha256	3655526d6dbfc697c22cd9b279e14599f8449f5802b12d84485bdc52d96482f0	glib-networking-2.46.0.tar.xz
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index b12c978..67a9203 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.44
+GLIB_NETWORKING_VERSION_MAJOR = 2.46
 GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
-- 
2.4.9
