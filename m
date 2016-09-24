From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 24 Sep 2016 14:28:41 -0300
Subject: [Buildroot] [PATCH 8/9] libsigc: bump to version 2.10.0
In-Reply-To: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474738122-18949-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474738122-18949-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsigc/libsigc.hash | 4 ++--
 package/libsigc/libsigc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index c452414..a630534 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.8/libsigc++-2.8.0.sha256sum
-sha256	774980d027c52947cb9ee4fac6ffe2ca60cc2f753068a89dfd281c83dbff9651	libsigc++-2.8.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.0.sha256sum
+sha256	f843d6346260bfcb4426259e314512b99e296e8ca241d771d21ac64f28298d81	libsigc++-2.10.0.tar.xz
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index f3ca970..590cbaa 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 2.8
+LIBSIGC_VERSION_MAJOR = 2.10
 LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).0
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
-- 
2.7.3
