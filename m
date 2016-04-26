From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 21:56:57 +0200
Subject: [Buildroot] [git commit] glib-networking: bump to version 2.48.1
Message-ID: <20160426195701.B9B0881999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ab8d390610a6995137df45a9205d2a68fbb97e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 7b22592..223ebcd 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.48/glib-networking-2.48.0.sha256sum
-sha256	7a1f3312e757b97af94e2db8a1f14eb9cc018c983931ecdf3b0c54acece39024	glib-networking-2.48.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.48/glib-networking-2.48.1.sha256sum
+sha256	cf9923ab9860011c5af6d58b0aa1db693d353f2008014a3dcb07af1952bea44a	glib-networking-2.48.1.tar.xz
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index a568321..6930967 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIB_NETWORKING_VERSION_MAJOR = 2.48
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
