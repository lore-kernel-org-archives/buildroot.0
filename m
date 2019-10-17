From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Oct 2019 19:21:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20191017172119.11177-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index ea24aec1cb..8928a42dd0 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6a7703fbbe553a2d9f87acafc01162d81f78c6e427b8ab9c83242e1677248582  tvheadend-8f1de1621d78c91431238176bf4f6290870a031a.tar.gz
+sha256 313267b2e2752e5a150e225ec735e7cb9e9af8bb7e9bd05391262f0df01d1437  tvheadend-baf746bc1d420e7d628994922df0ddcb665f698f.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 61732a203c..377c224192 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 8f1de1621d78c91431238176bf4f6290870a031a
+TVHEADEND_VERSION = baf746bc1d420e7d628994922df0ddcb665f698f
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.20.1
