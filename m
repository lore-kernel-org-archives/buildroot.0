From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:16:00 +0100
Subject: [Buildroot] [git commit branch/next] libgtk3: bump version to 3.22.4
Message-ID: <20161130211644.B60AC81946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8fa916ffcc491c1ab0a7fc728d642ac34cc0abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
  http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.4.news

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 1c58efc..e1d93b3 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.3.sha256sum
-sha256 e190ab1a9a893861b8e8be341aa57bce8b7146d6445ebfe5a8ab64236fe82ed3  gtk+-3.22.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.4.sha256sum
+sha256 7094a6fcfe133d01c578358bd5d3e499715f1a0206e87bd5cf6c834e301f387f  gtk+-3.22.4.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 0b9a999..4a686e0 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).3
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).4
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
