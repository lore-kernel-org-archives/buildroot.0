From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:24:50 +0200
Subject: [Buildroot] [git commit] package/dfu-util: bump version to 0.8,
	add hash, fix SITE url
Message-ID: <20150419122631.23F6C81918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c212a90b612adb18aba7d74c74bda863e372d265
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://dfu-util.gnumonks.org is down

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dfu-util/dfu-util.hash |    2 ++
 package/dfu-util/dfu-util.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

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
 
