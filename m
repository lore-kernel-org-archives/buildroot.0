From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 27 Jul 2016 07:46:24 -0500
Subject: [Buildroot] [PATCH v2 2/2] fmc: bump to fsl-sdk-v2.0
In-Reply-To: <1469623584-54185-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469623584-54185-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1469623584-54185-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/fmc/fmc.hash | 2 ++
 package/fmc/fmc.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/fmc/fmc.hash

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
new file mode 100644
index 0000000..2402831
--- /dev/null
+++ b/package/fmc/fmc.hash
@@ -0,0 +1,2 @@
+# Locally Computed
+sha256sum	a91e0c9b7c7f238634c64a755c05671f33f2acdb6ae2d09cad4d683b364ee8e4	fmc-fsl-sdk-v2.0.tar.gz
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
-- 
1.9.1
