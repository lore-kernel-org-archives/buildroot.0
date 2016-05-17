From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 May 2016 14:04:42 -0500
Subject: [Buildroot] [PATCH 3/4] fmc: bump to SDK 1.8
In-Reply-To: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1463511883-27657-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/fmc/fmc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 4712385..8b469a0 100644
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
-- 
1.9.1
