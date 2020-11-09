From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  9 Nov 2020 23:38:21 +0100
Subject: [Buildroot] [PATCH v1] package/bcm2835: bump version to 1.68
Message-ID: <20201109223821.6896-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index 8317e10256..e366f19038 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  62955cc8506cc6506d729da3138442beb9763f1ffd536e925aeb0dc223492874  bcm2835-1.65.tar.gz
+sha256  b7eda59fd7bc3cb97fdac14e8455e86ddad75006d69270358ac8d00108e369a9  bcm2835-1.68.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index 2ef6d94b38..1ddd035818 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.65
+BCM2835_VERSION = 1.68
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
-- 
2.29.2
