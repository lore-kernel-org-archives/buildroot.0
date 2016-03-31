From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Mar 2016 16:41:10 -0300
Subject: [Buildroot] [PATCH] libgtk3: bump to version 3.20.2
Message-ID: <1459453270-2603-1-git-send-email-gustavo@zacarias.com.ar>
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
index 37e5661..1b9e252 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.1.sha256sum
-sha256	ac86a01a57b4258ea70bc85b9494b333226eda6f5a2b0716ad48cfcded5f5380	gtk+-3.20.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.2.sha256sum
+sha256	1ab1d1068ea55e0046f437d69983f164df5e68cb2e9fdfb38787b867f33f69f7	gtk+-3.20.2.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 417bf20..ff8333d 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.20
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).1
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
-- 
2.7.3
