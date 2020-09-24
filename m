From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 24 Sep 2020 22:59:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsvg: bump to version 2.50.0
Message-ID: <20200924205924.2400291-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index c9fb23807f..da9f758f48 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.48/librsvg-2.48.8.sha256sum
-sha256  f480a325bbdf26d1874eb6fb330ebc5920ba64e3e08de61931bb4506dfef2692  librsvg-2.48.8.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.50/librsvg-2.50.0.sha256sum
+sha256  b3fadba240f09b9c9898ab20cb7311467243e607cf8f928b7c5f842474ee3df4  librsvg-2.50.0.tar.xz
 
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 67bc743656..120f71c792 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBRSVG_VERSION_MAJOR = 2.48
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).8
+LIBRSVG_VERSION_MAJOR = 2.50
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).0
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-- 
2.28.0
