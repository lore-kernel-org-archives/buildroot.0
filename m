From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:12:37 -0700
Subject: [Buildroot] [PATCH 21/27] package/xterm: bump to version 348
Message-ID: <20190908161237.27103-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add COPYING to _LICENSE_FILES

Add hashs for _LICENSE_FILES

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/xterm/xterm.hash | 5 ++++-
 package/xterm/xterm.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
index bbd0e11002..f00b0be13c 100644
--- a/package/xterm/xterm.hash
+++ b/package/xterm/xterm.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	66fb2f6c35b342148f549c276b12a3aa3fb408e27ab6360ddec513e14376150b	xterm-327.tgz
+sha256 8b1f5121dbf3690de9d85a3b9329e3357021705dd7c21da192e47542769275be xterm-348.tgz
+# Locally calculated
+sha256 b0d302c6d67f63122bbe8d622dd8a66cfadccc32853f606b7558103609201993 COPYING
+sha256 8a9f3304ee104fe8bc42964076d3985f0ca184d12733d887dfdb1066203b6918 version.c
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 201280fd46..26c0a80c06 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-XTERM_VERSION = 327
+XTERM_VERSION = 348
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = http://invisible-mirror.net/archives/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
 XTERM_LICENSE = MIT
-XTERM_LICENSE_FILES = version.c
+XTERM_LICENSE_FILES = version.c COPYING
 XTERM_CONF_OPTS = --enable-256-color \
 	--x-includes=$(STAGING_DIR)/usr/include \
 	--x-libraries=$(STAGING_DIR)/usr/lib
-- 
2.20.1
