From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 15 Jul 2020 19:41:02 -0300
Subject: [Buildroot] [PATCH] package/zlog: bump version to 1.2.15
Message-ID: <20200715224102.17594-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/zlog/zlog.hash | 4 ++--
 package/zlog/zlog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index b9f254056bfd..c39505b2c699 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 05a6533e32f313eeaf134a761481a5cbc586c5dc85ba9ee6771c7458daaeb031 zlog-1.2.14.tar.gz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
+sha256  00037ab8d52772a95d645f1dcfd2c292b7cea326b54e63e219a5b7fdcb7e6508  zlog-1.2.15.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index d9aeae7c7fca..e2410d3665f1 100644
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
-- 
2.17.1
