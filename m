From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 11:50:33 +0200
Subject: [Buildroot] [git commit] gtksourceview: bump to version 3.24.7
Message-ID: <20180501095048.9A88E8A555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24c1751a002b5c2894169b9a1f25a93599e04b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtksourceview/gtksourceview.hash | 4 ++--
 package/gtksourceview/gtksourceview.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtksourceview/gtksourceview.hash b/package/gtksourceview/gtksourceview.hash
index feaae5e29f..3b78b7062b 100644
--- a/package/gtksourceview/gtksourceview.hash
+++ b/package/gtksourceview/gtksourceview.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.6.sha256sum:
-sha256	7aa6bdfebcdc73a763dddeaa42f190c40835e6f8495bb9eb8f78587e2577c188	gtksourceview-3.24.6.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-3.24.7.sha256sum:
+sha256	a5c20d3a6347533689358f3ea52486409f6dd41d5a69c65eab7570cfaffee8e6	gtksourceview-3.24.7.tar.xz
 
 # Locally computed:
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	COPYING
diff --git a/package/gtksourceview/gtksourceview.mk b/package/gtksourceview/gtksourceview.mk
index 2a33ed4bdb..ae1d3ff295 100644
--- a/package/gtksourceview/gtksourceview.mk
+++ b/package/gtksourceview/gtksourceview.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GTKSOURCEVIEW_VERSION_MAJOR = 3.24
-GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).6
+GTKSOURCEVIEW_VERSION = $(GTKSOURCEVIEW_VERSION_MAJOR).7
 GTKSOURCEVIEW_SOURCE = gtksourceview-$(GTKSOURCEVIEW_VERSION).tar.xz
 GTKSOURCEVIEW_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gtksourceview/$(GTKSOURCEVIEW_VERSION_MAJOR)
