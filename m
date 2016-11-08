From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 8 Nov 2016 11:37:48 +0000
Subject: [Buildroot] [PATCH next] libgtk3: bump version to 3.22.3
Message-ID: <20161108113748.18786-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Overview of Changes in GTK+ 3.22.3:
http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.3.news

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index b606717..1c58efc 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.2.sha256sum
-sha256	2343dcaed2fc237ef718136ff4110fef7eb1ebfe178a9b064aa21cd74ecb6946	gtk+-3.22.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.3.sha256sum
+sha256 e190ab1a9a893861b8e8be341aa57bce8b7146d6445ebfe5a8ab64236fe82ed3  gtk+-3.22.3.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index b7cea7d..0b9a999 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).3
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
-- 
2.10.1
