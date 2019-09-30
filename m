From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:53:26 +0200
Subject: [Buildroot] [git commit] package/s6-linux-utils: bump version to
 2.5.1.0
Message-ID: <20190930204831.411F583CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371c24ac82f6fd2eb09b1f8a678bc64f85a55c57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the COPYING file is updated to take into account the
copyright year change:

-Copyright (c) 2011-2018 Laurent Bercot <ska-skaware@skarnet.org>
+Copyright (c) 2011-2019 Laurent Bercot <ska-skaware@skarnet.org>

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-linux-utils/s6-linux-utils.hash | 4 ++--
 package/s6-linux-utils/s6-linux-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index 20af7328d7..979d145d67 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 78571574464c76fc623ef50dc14800138b4fd98c5fa877af6850fdd9c2f90213  s6-linux-utils-2.5.0.0.tar.gz
-sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
+sha256 58d6cbbaabf5c03739716e208f1690f7e7241480583cc9f5396093b428941bba  s6-linux-utils-2.5.1.0.tar.gz
+sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
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
