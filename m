From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Jul 2016 15:20:36 -0500
Subject: [Buildroot] [PATCH] fmc and fmlib: bump version to fsl-sdk-v2.0
Message-ID: <1469564436-5079-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ronak Desai <ronak.desai@rockwellcollins.com>

Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/fmc/fmc.mk     | 2 +-
 package/fmlib/fmlib.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 2bd7a98..2a95fec 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = fsl-sdk-v1.8
+FMC_VERSION = fsl-sdk-v2.0
 FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 405ee14..42cdc27 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMLIB_VERSION = fsl-sdk-v1.8
+FMLIB_VERSION = fsl-sdk-v2.0
 FMLIB_SITE = git://git.freescale.com/ppc/sdk/fmlib.git
 FMLIB_LICENSE = BSD-3c, GPLv2+
 FMLIB_LICENSE_FILES = COPYING
-- 
1.9.1
