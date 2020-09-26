From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:44:55 +0200
Subject: [Buildroot] [git commit] package/librsvg: bump to version 2.50.0
Message-ID: <20200926133529.8FB8283960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b9493bb137be3099a5e97e95034612c61e24d40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
