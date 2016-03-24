From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:51:58 +0100
Subject: [Buildroot] [git commit] libsoup: bump to version 2.54.0.1
Message-ID: <20160324215205.935048190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d14bf1780f551d8df4846df74cd78b0e8fd4d2b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoup/libsoup.hash | 4 ++--
 package/libsoup/libsoup.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index facedc6..299cdd8 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.54/libsoup-2.54.0.sha256sum
-sha256	fbf1038efb10d2ffbbb88bb46e7ce32b683fde8e566f36bcf26f7f69a550ec56	libsoup-2.54.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.54/libsoup-2.54.0.1.sha256sum
+sha256	ade4920166bd036e8890d04acdc135686d877670953949fa6245797c906e38e0	libsoup-2.54.0.1.tar.xz
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 53138be..5f0057a 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP_VERSION_MAJOR = 2.54
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0.1
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
