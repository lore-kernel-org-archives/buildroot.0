From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 00:00:44 +0100
Subject: [Buildroot] [git commit] gtksourceview: bump to version 3.24.5
Message-ID: <20171202230428.4BA6D82224@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f4b3ad46b558b571d1b07a46f4ad71a9ca5906e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtksourceview/gtksourceview.hash | 7 +++++--
 package/gtksourceview/gtksourceview.mk   | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index f57fadc..c605253 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,2 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.22/gtksourceview-3.22.2.sha256sum:
-sha256	6ce84231dd0931cc747708434ca2f344c65a092dd6e1a800283fe0748773af5e	gtksourceview-3.22.2.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.5.sha256sum:
+sha256	0246185fcc20c4734d01419a83f58f251a82e2a902fe60bb0335187fcf658181	gtksourceview-3.24.5.tar.xz
+
+# Locally computed:
+sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index 290effb..b9bf4a3 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTKSOURCEVIEW_VERSION_MAJOR = 3.22
-GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).2
+GTKSOURCEVIEW_VERSION_MAJOR = 3.24
+GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).5
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
