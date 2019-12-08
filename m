From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2019 08:52:00 +0100
Subject: [Buildroot] [git commit] package/zlog: bump to version 1.2.14
Message-ID: <20191208074522.DEB0388734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5c482ac1582338283854dce08468d1a560785f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlog/zlog.hash | 2 +-
 package/zlog/zlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index 699f75c38e..b9f254056b 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b150ff725e5f9e839f41c0f3d2e8f0e3cc303aa51194be0bc34a3c3299acc059 zlog-ccf8c36e918d6f3c7e6fe9e36eedf8583014c5c9.tar.gz
+sha256 05a6533e32f313eeaf134a761481a5cbc586c5dc85ba9ee6771c7458daaeb031 zlog-1.2.14.tar.gz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index fedce12cbb..d9aeae7c7f 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLOG_VERSION = ccf8c36e918d6f3c7e6fe9e36eedf8583014c5c9
+ZLOG_VERSION = 1.2.14
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
