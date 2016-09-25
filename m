From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Sep 2016 23:13:36 +0200
Subject: [Buildroot] [git commit] gtksourceview: bump to version 3.22.0
Message-ID: <20160925211356.4EFBB7FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e5f53a73ddff1cf330886998a0cd1c5bf2ce1de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtksourceview/gtksourceview.hash | 4 ++--
 package/gtksourceview/gtksourceview.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index 1fd22af..7a00cd1 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.21/gtksourceview-3.21.3.sha256sum:
-sha256	12ea703e1903215629580ddab7751e419bf73a8aacfbbc53c75dc1b9cb0dfba7	gtksourceview-3.21.3.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.22/gtksourceview-3.22.0.sha256sum:
+sha256	70657f48732427984dce6cc812bdd3f2b701c0a49e0a0a08889705b3dadcf8e5	gtksourceview-3.22.0.tar.xz
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index 601d6e0..9ddce5a 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTKSOURCEVIEW_VERSION_MAJOR = 3.21
-GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).3
+GTKSOURCEVIEW_VERSION_MAJOR = 3.22
+GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).0
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
