From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:10:11 +0200
Subject: [Buildroot] [PATCH 04/10] package/s6-linux-utils: bump version to
 2.5.1.0
In-Reply-To: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171017.26831-5-eric.le.bihan.dev@free.fr>
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
index 20af7328d7..8d929a1943 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 78571574464c76fc623ef50dc14800138b4fd98c5fa877af6850fdd9c2f90213  s6-linux-utils-2.5.0.0.tar.gz
+sha256 58d6cbbaabf5c03739716e208f1690f7e7241480583cc9f5396093b428941bba  s6-linux-utils-2.5.1.0.tar.gz
 sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index 619f4c3732..689eda6331 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.5.0.0
+S6_LINUX_UTILS_VERSION = 2.5.1.0
 S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
-- 
2.21.0
