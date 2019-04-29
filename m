From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Apr 2019 22:15:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/intel-mediasdk: fix license
Message-ID: <20190429201549.30334-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/5730991fded5ab3474cd0325b399f6f27972ca81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/intel-mediasdk/intel-mediasdk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 611529390b..c47e99117f 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -7,7 +7,7 @@
 INTEL_MEDIASDK_VERSION = 18.4.0
 INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
-INTEL_MEDIASDK_LICENSE_FILES = COPYING
+INTEL_MEDIASDK_LICENSE_FILES = LICENSE
 
 INTEL_MEDIASDK_INSTALL_STAGING = YES
 INTEL_MEDIASDK_DEPENDENCIES = intel-mediadriver
-- 
2.20.1
