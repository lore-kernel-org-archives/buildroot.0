From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:39:51 +0100
Subject: [Buildroot] [git commit] package/s6-linux-utils: bump version to
 2.5.1.1
Message-ID: <20191104213335.07E498E748@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d23e0a23a43e2afd5c9cc3af35aea30b8f1989f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
