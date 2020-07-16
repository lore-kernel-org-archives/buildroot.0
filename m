From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:10:40 +0200
Subject: [Buildroot] [git commit] package/zlog: bump version to 1.2.15
Message-ID: <20200716071707.2CE2D8221F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5d188a01e7a44caa85a2fbcc2fd626ced0d42ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlog/zlog.hash | 4 ++--
 package/zlog/zlog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index b9f254056b..c39505b2c6 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 05a6533e32f313eeaf134a761481a5cbc586c5dc85ba9ee6771c7458daaeb031 zlog-1.2.14.tar.gz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
+sha256  00037ab8d52772a95d645f1dcfd2c292b7cea326b54e63e219a5b7fdcb7e6508  zlog-1.2.15.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index d9aeae7c7f..e2410d3665 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.14
+ZLOG_VERSION = 1.2.15
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
