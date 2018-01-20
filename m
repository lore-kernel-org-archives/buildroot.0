From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Jan 2018 23:52:27 +0100
Subject: [Buildroot] [PATCH 1/1] gtksourceview: bump to version 3.24.6
Message-ID: <20180120225227.3728-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtksourceview/gtksourceview.hash | 4 ++--
 package/gtksourceview/gtksourceview.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index c6052531b7..feaae5e29f 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.5.sha256sum:
-sha256	0246185fcc20c4734d01419a83f58f251a82e2a902fe60bb0335187fcf658181	gtksourceview-3.24.5.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.6.sha256sum:
+sha256	7aa6bdfebcdc73a763dddeaa42f190c40835e6f8495bb9eb8f78587e2577c188	gtksourceview-3.24.6.tar.xz
 
 # Locally computed:
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index b9bf4a3743..2a33ed4bdb 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GTKSOURCEVIEW_VERSION_MAJOR = 3.24
-GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).5
+GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).6
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
-- 
2.14.1
