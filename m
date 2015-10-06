From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Oct 2015 18:33:52 +0200
Subject: [Buildroot] [git commit] glib-networking: bump to version 2.46.0
Message-ID: <20151006163601.E835D7FE11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40ac0d3440c85ec8208402023a4fcee5bad0d8dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glib-networking/glib-networking.hash |    4 ++--
 package/glib-networking/glib-networking.mk   |    2 +-
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
