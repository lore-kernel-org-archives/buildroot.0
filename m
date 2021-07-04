From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jul 2021 19:23:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/hdparm: bump version to 9.62
Message-ID: <20210704172345.69453-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated project site (old site was not updated since 2010) and package
help text.

Removed md5 hash.

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hdparm/Config.in   | 4 ++--
 package/hdparm/hdparm.hash | 7 +++----
 package/hdparm/hdparm.mk   | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/hdparm/Config.in b/package/hdparm/Config.in
index 52385b18ce..17ecb65ce9 100644
--- a/package/hdparm/Config.in
+++ b/package/hdparm/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_HDPARM
 	bool "hdparm"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  hdparm - get/set hard disk parameters for Linux IDE drives.
+	  hdparm - get/set ATA/SATA drive parameters under Linux
 
-	  http://www.ibiblio.org/pub/Linux/system/hardware/
+	  https://sourceforge.net/projects/hdparm/
diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index b35da45273..b37826caf2 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,6 +1,5 @@
-# From http://sourceforge.net/projects/hdparm/files/hdparm/
-md5  25a791d47236c58801f8b27074f3ef93  hdparm-9.60.tar.gz
-sha1  f15378cf533f79dbbc040cd77183137d24292ecc  hdparm-9.60.tar.gz
+# From https://sourceforge.net/projects/hdparm/files/hdparm/
+sha1  100b9a5551b71d87b446b415d56c5d45ac41d131  hdparm-9.62.tar.gz
 # Locally computed
-sha256  8397739c73e44d5ab96c4aef28fa9c0147276d53a1b5657ce04c4565cf6635cc  hdparm-9.60.tar.gz
+sha256  2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29d4c1038ed1be777f  hdparm-9.62.tar.gz
 sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1  LICENSE.TXT
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index d9470ef7f5..6a71c14fa7 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.60
-HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
+HDPARM_VERSION = 9.62
+HDPARM_SITE = https://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
 
-- 
2.30.2
