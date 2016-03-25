From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 20:54:53 +0100
Subject: [Buildroot] [git commit] libgtk3: bump to version 3.20.1
Message-ID: <20160325200621.CFBAD81D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c3dc8b07824aed275f5c941e4de80b5b291962c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 957f0af..37e5661 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.0.sha256sum
-sha256	1c3d3a4a6e959ec8636ccb074bcdb8fa25c81ec56fbc70de6a3f5ef83ba6d803	gtk+-3.20.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.1.sha256sum
+sha256	ac86a01a57b4258ea70bc85b9494b333226eda6f5a2b0716ad48cfcded5f5380	gtk+-3.20.1.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 596f236..417bf20 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.20
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).0
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).1
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
