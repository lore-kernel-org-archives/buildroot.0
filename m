From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Mar 2017 10:48:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/chrony: bump version to 3.1
Message-ID: <20170305094852.20985-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/chrony/chrony.hash | 6 +++---
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 66ec0603f..850180883 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,3 +1,3 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2016/11/msg00000.html
-md5  d08dd5a7d79a89891d119adcccb4397d  chrony-2.4.1.tar.gz
-sha1 b412375ca90dbef653ad00534f8b73b825e396d4  chrony-2.4.1.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2017/01/msg00003.html
+md5 f8d2ee78c55548bfbe95582c6a855cee  chrony-3.1.tar.gz
+sha1 564dd010a10fbdcc7c177337115ccffa43fe0f95  chrony-3.1.tar.gz
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 0dca2eef5..c3d48a78f 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 2.4.1
+CHRONY_VERSION = 3.1
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
-- 
2.11.0
