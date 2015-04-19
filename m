From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 14:01:29 +0200
Subject: [Buildroot] [PATCH 1/5] package/dfu-util: bump version to 0.8,
	add hash, fix SITE url
Message-ID: <1429444893-13874-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://dfu-util.gnumonks.org is down

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dfu-util/dfu-util.hash |    2 ++
 package/dfu-util/dfu-util.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/dfu-util/dfu-util.hash

diff --git a/package/dfu-util/dfu-util.hash b/package/dfu-util/dfu-util.hash
new file mode 100644
index 0000000..0901717
--- /dev/null
+++ b/package/dfu-util/dfu-util.hash
@@ -0,0 +1,2 @@
+# From http://dfu-util.sourceforge.net/releases/dfu-util-0.8.tar.gz.md5
+md5	fc6daf6b0ee57d7e40ffa3e8111023d1	dfu-util-0.8.tar.gz
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index 62d1ad9..3e612db 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DFU_UTIL_VERSION = 0.6
-DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases
+DFU_UTIL_VERSION = 0.8
+DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
 DFU_UTIL_LICENSE = GPLv2+
 DFU_UTIL_LICENSE_FILES = COPYING
 
-- 
1.7.10.4
