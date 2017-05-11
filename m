From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:19:38 +0200
Subject: [Buildroot] [git commit branch/next] libgtk3: bump version to
	3.22.14
Message-ID: <20170511191942.7AF8D8081B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ada454eeffab10c3914f078c73b1141c84f2f47f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 10dcb4d..cbba7ca 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.12.sha256sum
-sha256 84fae0cefb6a11ee2b4e86b8ac42fe46a3d30b4ad16661d5fc51e8ae03e2a98c  gtk+-3.22.12.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.14.sha256sum
+sha256 d6120e4fd64e432b74a61e8abd972b1948cf54e4dc4f0e081c05ab625f087131  gtk+-3.22.14.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 1759953..7d8eecb 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).12
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).14
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
