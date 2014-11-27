From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:31:21 +0100
Subject: [Buildroot] [git commit branch/next] libz160: fix comment header
Message-ID: <20141127213133.58AE47FF3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83aded6ce8dd6244193e08d7a202790c06b1c6c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/libz160/libz160.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/libz160/libz160.mk b/package/freescale-imx/libz160/libz160.mk
index 55e7217..af43b18 100644
--- a/package/freescale-imx/libz160/libz160.mk
+++ b/package/freescale-imx/libz160/libz160.mk
@@ -1,8 +1,9 @@
-#############################################################
+################################################################################
 #
 # libz160
 #
-#############################################################
+################################################################################
+
 LIBZ160_VERSION = 11.09.01
 LIBZ160_SOURCE = libz160-bin-$(LIBZ160_VERSION).bin
 LIBZ160_SITE = $(FREESCALE_IMX_SITE)
