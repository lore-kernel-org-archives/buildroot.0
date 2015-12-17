From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Dec 2015 19:42:25 -0300
Subject: [Buildroot] [PATCH] libcroco: bump to version 0.6.11
Message-ID: <1450392145-14955-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcroco/libcroco.hash | 4 ++--
 package/libcroco/libcroco.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcroco/libcroco.hash b/package/libcroco/libcroco.hash
index 20328e4..edf0b1f 100644
--- a/package/libcroco/libcroco.hash
+++ b/package/libcroco/libcroco.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.10.sha256sum
-sha256	72066611df77f5c4fb28268cfc7306ecc1517212a6182c2ea756c326a154246c	libcroco-0.6.10.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libcroco/0.6/libcroco-0.6.11.sha256sum
+sha256	132b528a948586b0dfa05d7e9e059901bca5a3be675b6071a90a90b81ae5a056	libcroco-0.6.11.tar.xz
diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
index 2376684..0cda9da 100644
--- a/package/libcroco/libcroco.mk
+++ b/package/libcroco/libcroco.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCROCO_VERSION_MAJOR = 0.6
-LIBCROCO_VERSION = $(LIBCROCO_VERSION_MAJOR).10
+LIBCROCO_VERSION = $(LIBCROCO_VERSION_MAJOR).11
 LIBCROCO_SITE = http://ftp.gnome.org/pub/gnome/sources/libcroco/$(LIBCROCO_VERSION_MAJOR)
 LIBCROCO_SOURCE = libcroco-$(LIBCROCO_VERSION).tar.xz
 LIBCROCO_INSTALL_STAGING = YES
-- 
2.4.10
