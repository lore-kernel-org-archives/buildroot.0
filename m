From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 17:57:39 +0000
Subject: [Buildroot] [PATCH 5/9] package/s6-linux-utils: bump to version
 2.5.1.4
Message-ID: <WqB9ymaAwxNT2FW8oASSk27KJIcDLFF3fz0Qgj36rE@cp7-web-044.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1515:mhcdpginfgieagphalne

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6-linux-utils/s6-linux-utils.hash | 2 +-
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 638b6b8160..acb65cce88 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 25f61961f3247b9a833536ebd1e19f3b024fa095fce30f93d82fdfd4e015dc02  s6-linux-utils-2.5.1.1.tar.gz
+sha256 d8ad8dcc8d805646b655971ddcaabcd50094d8347bd49d859ba2c51713fbfd09  s6-linux-utils-2.5.1.4.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 926ec523a1..dcc4f9e4b2 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.5.1.1
+S6_LINUX_UTILS_VERSION = 2.5.1.4
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
-- 
2.30.2
