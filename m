From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 Apr 2020 23:11:11 +0200
Subject: [Buildroot] [PATCH v1] package/bcm2835: bump version to 1.63
Message-ID: <20200407211111.11489-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update license to GPL-3.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bcm2835/bcm2835.hash | 4 ++--
 package/bcm2835/bcm2835.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index 025ef8be40..c722a97456 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7beacda787d6073d0982bfe576c318bb2730700f7d0f7950c6e763dfcb06e0e5  bcm2835-1.62.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  aec4b33ed9ecda4a1c4c12b8ed2abdd13cf87f352f0d27a24be726d11f1fbf54  bcm2835-1.63.tar.gz
+sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index 2435a42c95..d43dd7e574 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.62
+BCM2835_VERSION = 1.63
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
-BCM2835_LICENSE = GPL-2.0
+BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
 BCM2835_INSTALL_STAGING = YES
 
-- 
2.26.0
