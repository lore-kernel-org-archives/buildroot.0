From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Oct 2015 18:33:43 +0200
Subject: [Buildroot] [git commit] libglib2: bump to version 2.46.0
Message-ID: <20151006163601.E4FD181EA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45a8af919048c4953f16afc4faf4ac0512512201
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.hash |    4 ++--
 package/libglib2/libglib2.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index f3c4a66..9a54c3f 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.44/glib-2.44.1.sha256sum
-sha256  8811deacaf8a503d0a9b701777ea079ca6a4277be10e3d730d2112735d5eca07  glib-2.44.1.tar.xz
+# https://download.gnome.org/sources/glib/2.46/glib-2.46.0.sha256sum
+sha256  b1cee83469ae7d80f17c267c37f090414e93960bd62d2b254a5a96fbc5baacb4  glib-2.46.0.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 516f5fa..b62e8b0 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.44
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
+LIBGLIB2_VERSION_MAJOR = 2.46
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
