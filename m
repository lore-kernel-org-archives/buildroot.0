From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Nov 2017 10:18:40 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/eudev: bump version to 3.2.5
Message-ID: <20171125091840.17239-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/eudev.hash | 5 +++--
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 75f2cc1c48..3fa47980ec 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,4 +1,5 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 66acef4c6094aab4aced7ae83b74b0d2  eudev-3.2.4.tar.gz
+md5 6ca08c0e14380f87df8e8aceac123671  eudev-3.2.5.tar.gz
 # Locally calculated
-sha256 dddcf4c89b21f5f3210f7e4d3888c92cbfc657ff734ac21b6bdd3f5bcb146fed  eudev-3.2.4.tar.gz
+sha256 49c2d04105cad2526302627e040fa24b1916a9a3e059539bc8bb919b973890af  eudev-3.2.5.tar.gz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index b712475861..d08b9bb0c9 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.4
+EUDEV_VERSION = 3.2.5
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
-- 
2.11.0
