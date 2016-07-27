From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:31:48 +0200
Subject: [Buildroot] [git commit] fmc: bump to fsl-sdk-v2.0
Message-ID: <20160727193318.600687FEC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fd8e46f4417a47c8b74157f5e38aaf22e685da8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fmc/fmc.hash | 2 ++
 package/fmc/fmc.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

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
