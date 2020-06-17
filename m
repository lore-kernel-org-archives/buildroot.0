From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:21:33 +0200
Subject: [Buildroot] [git commit] package/glib-networking: bump to version
 2.64.3
Message-ID: <20200617202045.86C8D83BA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9e3ec19d68b2c95435f7f2c347898bd294058e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 88649d842f..336e0aa07b 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.62/glib-networking-2.62.4.sha256sum
-sha256  c18f289eec480fdce12044c0a06f77521edf9f460d16ad4213de61f2a3b294cf  glib-networking-2.62.4.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.64/glib-networking-2.64.3.sha256sum
+sha256  937a06b124052813bfc0b0b86bff42016ff01067582e1aca65bb6dbe0845a168  glib-networking-2.64.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index e1d4823adc..295c7516cc 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.62
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).4
+GLIB_NETWORKING_VERSION_MAJOR = 2.64
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).3
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
