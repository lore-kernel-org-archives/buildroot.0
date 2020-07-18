From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:20:14 +0200
Subject: [Buildroot] [git commit] package/rtty: bump version to 7.1.4
Message-ID: <20200718134051.C953586D68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c80245ddbe78c8e443f98b9bbccac56331cdb26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtty/rtty.hash | 2 +-
 package/rtty/rtty.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index feaac4762d..b49004ca1f 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  e10ee2048a29e18e6b21c77cb9cf7772eb95646e69567f8b40e85b816d93a3fa  rtty-7.1.3.tar.gz
+sha256  f0b8cf4c4d3d4b34d10097fe430d32ab1576edbf41131d27b6b964e078be1716  rtty-7.1.4.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 0b787a6353..b0efda0470 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.1.3
+RTTY_VERSION = 7.1.4
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
