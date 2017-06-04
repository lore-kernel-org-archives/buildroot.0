From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 15:04:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/gqrx: bump version to 2.6.1
Message-ID: <20170604130422.29773-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gqrx/gqrx.hash | 2 +-
 package/gqrx/gqrx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 2d126aa50..bb52a616d 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 53d25db8d987a41ccccaf6fd85262bd7770cdfab5539b5901c4558756483c9db  gqrx-v2.6.tar.gz
+sha256 2736a963dac4051ca8ae91a440ee6643ef7d26c9de5b9c83a369d5fc9328d453  gqrx-v2.6.1.tar.gz
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index 12e79edbc..2a7651c25 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GQRX_VERSION = v2.6
+GQRX_VERSION = v2.6.1
 GQRX_SITE = $(call github,csete,gqrx,$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
-- 
2.11.0
