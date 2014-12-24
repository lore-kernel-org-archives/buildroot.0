From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Dec 2014 09:21:03 -0300
Subject: [Buildroot] [PATCH] libpng: security bump to version 1.6.16
Message-ID: <1419423663-11355-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a buffer overflow which may allow an attacker to gain write
access to memory.
CVE requested but not yet assigned.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 37f6067..d0027c7 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.15/
-md5	a95cb387c53215b034203b41ec57c7e5	libpng-1.6.15.tar.xz
-sha1	bddeac8ca97fbcf54d6d32c6eefed5d94b49df88	libpng-1.6.15.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.16/
+md5	23b7286b5d4a86de950fd2ffc5cac742	libpng-1.6.16.tar.xz
+sha1	31855a8438ae795d249574b0da15b34eb0922e13	libpng-1.6.16.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 67bf141..2f53a95 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.15
+LIBPNG_VERSION = 1.6.16
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
-- 
2.0.4
