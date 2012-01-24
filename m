From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Jan 2012 23:34:15 +0100
Subject: [Buildroot] [git commit] libgtk2: bump version
Message-ID: <20120124223446.507F09039C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8cdf54d4dcd1d17c1e53cd2d7e4c1facac2de99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tarball is (so far?) only available as .xz

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgtk2/libgtk2.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 52edf47..cfdc8f9 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION_MINOR = 8
+LIBGTK2_VERSION_MINOR = 9
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
 
-LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.bz2
+LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_AUTORECONF = NO
 LIBGTK2_INSTALL_STAGING = YES
