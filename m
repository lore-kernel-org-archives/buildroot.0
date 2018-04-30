From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:38:23 +0200
Subject: [Buildroot] [git commit] menu-cache: bump to version 1.1.0
Message-ID: <20180430154010.8FD327FD51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8d2ea2e5db889d23f90ce48e915b09fb84ef308
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/menu-cache/menu-cache.hash | 9 ++++++---
 package/menu-cache/menu-cache.mk   | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/menu-cache/menu-cache.hash b/package/menu-cache/menu-cache.hash
index 1b30fcc11c..a46a7070ca 100644
--- a/package/menu-cache/menu-cache.hash
+++ b/package/menu-cache/menu-cache.hash
@@ -1,3 +1,6 @@
-# From https://sourceforge.net/projects/lxde/files/menu-cache/1.0/
-md5	a856ba860b16fdc8c69ee784bc4ade36	menu-cache-1.0.1.tar.xz
-sha1	58862c665f2ae56870a9937cdcd643674b2ac8ba	menu-cache-1.0.1.tar.xz
+# From https://sourceforge.net/projects/lxde/files/menu-cache/1.1/
+md5	99999a0bca48b980105208760c8fd893	menu-cache-1.1.0.tar.xz
+sha1	01e6035aa1fe76d7047bdec235254aa5ce17394a	menu-cache-1.1.0.tar.xz
+
+# Hash for license file:
+sha256	7459fbad62653e4061dbfde3b0cad7c72777838beb10d2d11d969fac6226e7de	COPYING
diff --git a/package/menu-cache/menu-cache.mk b/package/menu-cache/menu-cache.mk
index b5fde9907e..c2b8c3b740 100644
--- a/package/menu-cache/menu-cache.mk
+++ b/package/menu-cache/menu-cache.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MENU_CACHE_VERSION_MAJOR = 1.0
-MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).1
+MENU_CACHE_VERSION_MAJOR = 1.1
+MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).0
 MENU_CACHE_SOURCE = menu-cache-$(MENU_CACHE_VERSION).tar.xz
 MENU_CACHE_SITE = http://sourceforge.net/projects/lxde/files/menu-cache/$(MENU_CACHE_VERSION_MAJOR)
 MENU_CACHE_DEPENDENCIES = libfm-extra libglib2
