From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:55:45 +0200
Subject: [Buildroot] [git commit] menu-cache: bump to version 1.0.1
Message-ID: <20160723150127.920D781D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a8dc3ace0370a4ef4b4705c8e87f48435cc0894
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/menu-cache/menu-cache.hash | 5 +++--
 package/menu-cache/menu-cache.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/menu-cache/menu-cache.hash b/package/menu-cache/menu-cache.hash
index 3b9e5c4..1b30fcc 100644
--- a/package/menu-cache/menu-cache.hash
+++ b/package/menu-cache/menu-cache.hash
@@ -1,2 +1,3 @@
-# From http://blog.lxde.org/?p=1299
-sha1  e7b3854109f9826472cf9795e924acebe5e27861  menu-cache-1.0.0.tar.xz
+# From https://sourceforge.net/projects/lxde/files/menu-cache/1.0/
+md5	a856ba860b16fdc8c69ee784bc4ade36	menu-cache-1.0.1.tar.xz
+sha1	58862c665f2ae56870a9937cdcd643674b2ac8ba	menu-cache-1.0.1.tar.xz
diff --git a/package/menu-cache/menu-cache.mk b/package/menu-cache/menu-cache.mk
index 9d43864..1687825 100644
--- a/package/menu-cache/menu-cache.mk
+++ b/package/menu-cache/menu-cache.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MENU_CACHE_VERSION_MAJOR = 1.0
-MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).0
+MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).1
 MENU_CACHE_SOURCE = menu-cache-$(MENU_CACHE_VERSION).tar.xz
 MENU_CACHE_SITE = http://sourceforge.net/projects/lxde/files/menu-cache/$(MENU_CACHE_VERSION_MAJOR)
 MENU_CACHE_DEPENDENCIES = libfm-extra libglib2
