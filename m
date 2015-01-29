From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 Jan 2015 19:46:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: bump version to 0.98.6
Message-ID: <1422557161-7880-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.hash |    4 ++--
 package/clamav/clamav.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index dabda19..7913388 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,2 +1,2 @@
-# From http://sourceforge.net/projects/clamav/files/clamav/0.98.5/
-sha1	5f5e45735819e3ca61610899b779172a5639f70f	clamav-0.98.5.tar.gz
+# From http://sourceforge.net/projects/clamav/files/clamav/0.98.6/
+sha1	03cb9a20a08aba9176b1f58d5527d06ec8261f9c	clamav-0.98.6.tar.gz
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 9a4063f..6a8fddf 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.98.5
+CLAMAV_VERSION = 0.98.6
 CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
1.7.10.4
