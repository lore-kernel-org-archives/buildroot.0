From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  7 Sep 2017 20:22:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/eudev: bump version to 3.2.4
Message-ID: <20170907182204.6922-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/eudev.hash | 4 ++--
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 513dc7dd9..75f2cc1c4 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,4 +1,4 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 1e91710d6c42f03f803108091be5878f  eudev-3.2.3.tar.gz
+md5 66acef4c6094aab4aced7ae83b74b0d2  eudev-3.2.4.tar.gz
 # Locally calculated
-sha256 49200c54f63bb0ae922880a9bb64f360959fa83d272239b9cf72111dd53f444a  eudev-3.2.3.tar.gz
+sha256 dddcf4c89b21f5f3210f7e4d3888c92cbfc657ff734ac21b6bdd3f5bcb146fed  eudev-3.2.4.tar.gz
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index ff9407845..b71247586 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.3
+EUDEV_VERSION = 3.2.4
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
-- 
2.11.0
