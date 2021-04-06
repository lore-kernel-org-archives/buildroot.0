From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 17:57:33 +0000
Subject: [Buildroot] [PATCH 4/9] package/s6-portable-utils: bump to version
 2.2.3.1
Message-ID: <bjusLHndL78angVL2kDZrKkObFEKg5dXV52EnGAk@cp7-web-041.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://skarnet.org/cgi-bin/archive.cgi?1:mss:1515:mhcdpginfgieagphalne

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6-portable-utils/s6-portable-utils.hash | 2 +-
 package/s6-portable-utils/s6-portable-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
index 83823b3438..2340b53878 100644
--- a/package/s6-portable-utils/s6-portable-utils.hash
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 1e473224350c6ebedd7adf162b68303e2e0a32ca2e99d7afee7573d9e78f931c  s6-portable-utils-2.2.2.1.tar.gz
+sha256 43e68a9abec873b337baeee92075a1c2e22cdfffd595cb91475fdcb10b6441cf  s6-portable-utils-2.2.3.1.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index 8b60bf43e3..9da165b49b 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_PORTABLE_UTILS_VERSION = 2.2.2.1
+S6_PORTABLE_UTILS_VERSION = 2.2.3.1
 S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
 S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
-- 
2.30.2
