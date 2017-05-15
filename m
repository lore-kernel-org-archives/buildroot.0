From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 23:05:30 +0200
Subject: [Buildroot] [git commit branch/next] libgtk3: bump version to
	3.22.15
Message-ID: <20170515210736.343ED800FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57f0f9d43f9427f5e64dc5dfea806716c81c4f2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index cbba7ca..0f259e9 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.14.sha256sum
-sha256 d6120e4fd64e432b74a61e8abd972b1948cf54e4dc4f0e081c05ab625f087131  gtk+-3.22.14.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.15.sha256sum
+sha256 c8a012c2a99132629ab043f764a2b7cb6388483a015cd15c7a4288bec3590fdb  gtk+-3.22.15.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 7d8eecb..f3b1705 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).14
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).15
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
