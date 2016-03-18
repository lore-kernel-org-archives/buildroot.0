From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Mar 2016 10:29:01 -0300
Subject: [Buildroot] [PATCH] libsigc: bump to version 2.8.0
Message-ID: <1458307741-25918-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsigc/libsigc.hash | 4 ++--
 package/libsigc/libsigc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index b9c99c5..c452414 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.6/libsigc++-2.6.2.sha256sum
-sha256	fdace7134c31de792c17570f9049ca0657909b28c4c70ec4882f91a03de54437	libsigc++-2.6.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.8/libsigc++-2.8.0.sha256sum
+sha256	774980d027c52947cb9ee4fac6ffe2ca60cc2f753068a89dfd281c83dbff9651	libsigc++-2.8.0.tar.xz
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 0dc5d24..f3ca970 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 2.6
-LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).2
+LIBSIGC_VERSION_MAJOR = 2.8
+LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).0
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_DEPENDENCIES = host-m4
-- 
2.4.10
