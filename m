From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jun 2015 15:51:20 +0200
Subject: [Buildroot] [git commit] libgtk3: bump to version 3.14.13
Message-ID: <20150604135708.15A3B7FE54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d8b0b0525e283a83aaf704915ea50d9da2d1dea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.hash |    4 ++--
 package/libgtk3/libgtk3.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index e9e900f..de78751 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.11.sha256sum
-sha256	3fb59e99de38001b1b84a7f292553d0e2305991053d6989d6cd09acd1418f7c8	gtk+-3.14.11.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.13.sha256sum
+sha256	b1efcb1ef299f9b205e6f4512428315fd03484e5790f65bd3ac164e84ade90b0	gtk+-3.14.13.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 6badba3..ee73291 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.14
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).11
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).13
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
