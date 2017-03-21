From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Mar 2017 15:17:18 +0000
Subject: [Buildroot] [PATCH] libgtk3: bump version to 3.22.11
Message-ID: <20170321151718.40309-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 2407307..5ea0405 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.10.sha256sum
-sha256 352a90b3d09256d597cb2768ee5d685285ccc284ff22adf19df16753a829c554  gtk+-3.22.10.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.11.sha256sum
+sha256 db440670cb6f3c098b076df3735fbc4e69359bd605385e87c90ee48344a804ca  gtk+-3.22.11.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index abd4c64..ca88e30 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).10
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).11
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
-- 
2.10.2
