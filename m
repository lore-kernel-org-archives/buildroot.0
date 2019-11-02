From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 22:32:08 +0100
Subject: [Buildroot] [PATCH 9/9] package/s6-linux-utils: bump version to
 2.5.1.1
In-Reply-To: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
References: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191102213208.27075-10-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6-linux-utils/s6-linux-utils.hash | 2 +-
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 979d145d67..638b6b8160 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 58d6cbbaabf5c03739716e208f1690f7e7241480583cc9f5396093b428941bba  s6-linux-utils-2.5.1.0.tar.gz
+sha256 25f61961f3247b9a833536ebd1e19f3b024fa095fce30f93d82fdfd4e015dc02  s6-linux-utils-2.5.1.1.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 689eda6331..926ec523a1 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.5.1.0
+S6_LINUX_UTILS_VERSION = 2.5.1.1
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
-- 
2.21.0
