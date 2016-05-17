From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:26:13 +0200
Subject: [Buildroot] [git commit branch/next] fmc: bump to SDK 1.8
Message-ID: <20160517202648.17C0281DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b5bf8da4d6857f27f0f1c8375ae35d08c551c0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fmc/fmc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 49c5fe8..2146bc2 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = fsl-sdk-v1.5-rc3
+FMC_VERSION = fsl-sdk-v1.8
 FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
