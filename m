From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 23:40:19 +0000
Subject: [Buildroot] [PATCH v2 5/9] package/s6-linux-utils: bump to version
 2.5.1.4
Message-ID: <yqTJBjArOLHEBo7CiLOfFpqeLngfF0cq5no9GLUbM@cp4-web-036.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license hash due to year change.

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1515:mhcdpginfgieagphalne

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6-linux-utils/s6-linux-utils.hash | 4 ++--
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 638b6b8160..64caef793d 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 25f61961f3247b9a833536ebd1e19f3b024fa095fce30f93d82fdfd4e015dc02  s6-linux-utils-2.5.1.1.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256 d8ad8dcc8d805646b655971ddcaabcd50094d8347bd49d859ba2c51713fbfd09  s6-linux-utils-2.5.1.4.tar.gz
+sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
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
