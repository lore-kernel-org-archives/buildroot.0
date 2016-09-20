From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:07:52 +0200
Subject: [Buildroot] [git commit] glib-networking: bump to version 2.50.0
Message-ID: <20160920181525.6EECB8183B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cbf5557f84bfd2395fba26891e45cc9b36adf8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index a495af1..bbcecb7 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.48/glib-networking-2.48.2.sha256sum
-sha256	925c0c49d6b2b8b5695f2e33cd952d1dbb7d18d3f2f796413577719315bb3a84	glib-networking-2.48.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.50/glib-networking-2.50.0.sha256sum
+sha256	3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee	glib-networking-2.50.0.tar.xz
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index b6e40f8..d3077e9 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.48
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).2
+GLIB_NETWORKING_VERSION_MAJOR = 2.50
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
