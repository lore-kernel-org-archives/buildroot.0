From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:25:54 +0200
Subject: [Buildroot] [git commit] package/am335x-pru-package: bump version
Message-ID: <20160607112639.A890580409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=457805bb831c1441384145fbe276898088ef4ebd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/am335x-pru-package/am335x-pru-package.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index a4ff201..a97e8a4 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AM335X_PRU_PACKAGE_VERSION = 506e074859891a2b350eb4f5fcb451c4961410ea
+AM335X_PRU_PACKAGE_VERSION = 5f374ad57cc195f28bf5e585c3d446aba6ee7096
 AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_PRU_PACKAGE_VERSION))
 AM335X_PRU_PACKAGE_LICENSE = BSD-3c
 AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
