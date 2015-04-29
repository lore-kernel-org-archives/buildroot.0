From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Apr 2015 15:47:21 -0300
Subject: [Buildroot] [PATCH] clamav: security bump to version 0.98.7
Message-ID: <1430333241-3582-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-2221 - infinite loop condition on crafted y0da cryptor file.
CVE-2015-2668 - infinite loop condition on a crafted "xz" archive file.
CVE-2015-2305 - possible heap overflow in Henry Spencer's regex library.
CVE-2015-2170 - crash in upx decoder with crafted file.
CVE-2015-2222 - crash on crafted petite packed file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/clamav/clamav.hash | 5 +++--
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 7913388..97e4163 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,2 +1,3 @@
-# From http://sourceforge.net/projects/clamav/files/clamav/0.98.6/
-sha1	03cb9a20a08aba9176b1f58d5527d06ec8261f9c	clamav-0.98.6.tar.gz
+# From http://sourceforge.net/projects/clamav/files/clamav/0.98.7/
+md5	157c601161da1c2d5a0e48ea1b49e067	clamav-0.98.7.tar.gz
+sha1	c9793d67c041e2b944116d912f8681c8bd6e4432	clamav-0.98.7.tar.gz
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 6a8fddf..1cf0af6 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.98.6
+CLAMAV_VERSION = 0.98.7
 CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.0.5
