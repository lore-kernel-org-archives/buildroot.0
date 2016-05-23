From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 May 2016 18:09:08 -0300
Subject: [Buildroot] [PATCH] libgtk3: bump to version 3.20.6
Message-ID: <1464037748-1422-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 47f5977..b6998a4 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.5.sha256sum
-sha256	9790b0267384904ad8a08e7f16e5f9ff1c4037de57788d48d1eaf528355b1564	gtk+-3.20.5.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.6.sha256sum
+sha256	3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2	gtk+-3.20.6.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 469ff13..f447e7a 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.20
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).5
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).6
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
-- 
2.7.3
