From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Mar 2016 23:10:43 -0300
Subject: [Buildroot] [PATCH] libgtk2: bump to version 2.24.30
Message-ID: <1458612643-12317-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk2/libgtk2.hash | 4 ++--
 package/libgtk2/libgtk2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
index 1eb795d..175702f 100644
--- a/package/libgtk2/libgtk2.hash
+++ b/package/libgtk2/libgtk2.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.29.sha256sum
-sha256	0741c59600d3d810a223866453dc2bbb18ce4723828681ba24aa6519c37631b8	gtk+-2.24.29.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.30.sha256sum
+sha256	0d15cec3b6d55c60eac205b1f3ba81a1ed4eadd9d0f8e7c508bc7065d0c4ca50	gtk+-2.24.30.tar.xz
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 17cdfcb..971e33c 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK2_VERSION_MAJOR = 2.24
-LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).29
+LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).30
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
-- 
2.7.3
