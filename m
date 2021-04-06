From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 23:40:47 +0000
Subject: [Buildroot] [PATCH v2 9/9] package/s6-rc: bump to version 0.5.2.1
Message-ID: <gzZCwiZwVxgEPqrxVLZ09P8fN0kfzk4pPmVdBJ5ZE@cp3-web-033.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license hash due to year change.

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1515:mhcdpginfgieagphalne

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6-rc/s6-rc.hash | 4 ++--
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 918dc0fd2e..3648bec20a 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 257e2c428336c2b57cd17b65382bc55592759acc65e053e23ad646444f28af52  s6-rc-0.5.1.1.tar.gz
-sha256 487e89990a571700bcdf7c0cbbde2859446f79e85e8b59791adab98fff6b1889  COPYING
+sha256 2842fa55e2bddb65573d78d2c475c4a2f2b26b9258a18b457f8a0342e2fafa0a  s6-rc-0.5.2.1.tar.gz
+sha256 4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 3044341371..4e0ef57d7a 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.5.1.1
+S6_RC_VERSION = 0.5.2.1
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
-- 
2.30.2
