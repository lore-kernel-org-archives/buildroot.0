From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 14 Mar 2017 11:46:28 +0000
Subject: [Buildroot] [PATCH 3/3] libgtk3: bump version to 3.22.10
In-Reply-To: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
References: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
Message-ID: <20170314114628.10147-3-Vincent.Riera@imgtec.com>
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
index 395d460..2407307 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.9.sha256sum
-sha256 e414542c96dc9966d40774451331bd8f73f77b6670226a5bbd057973a0c6a3e1  gtk+-3.22.9.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.10.sha256sum
+sha256 352a90b3d09256d597cb2768ee5d685285ccc284ff22adf19df16753a829c554  gtk+-3.22.10.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 210f3e5..abd4c64 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).9
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).10
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
-- 
2.10.2
