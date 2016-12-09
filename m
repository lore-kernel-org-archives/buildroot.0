From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2016 10:51:40 -0300
Subject: [Buildroot] [PATCH] gtksourceview: bump to version 3.22.2
Message-ID: <1481291500-15323-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtksourceview/gtksourceview.hash | 4 ++--
 package/gtksourceview/gtksourceview.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index 7a00cd1..f57fadc 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.22/gtksourceview-3.22.0.sha256sum:
-sha256	70657f48732427984dce6cc812bdd3f2b701c0a49e0a0a08889705b3dadcf8e5	gtksourceview-3.22.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.22/gtksourceview-3.22.2.sha256sum:
+sha256	6ce84231dd0931cc747708434ca2f344c65a092dd6e1a800283fe0748773af5e	gtksourceview-3.22.2.tar.xz
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index 9ddce5a..5e4ca0d 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GTKSOURCEVIEW_VERSION_MAJOR = 3.22
-GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).0
+GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).2
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
-- 
2.7.3
