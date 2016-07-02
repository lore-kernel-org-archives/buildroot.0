From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:30 +0200
Subject: [Buildroot] [PATCH 01/69] am335x-pru-package: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-2-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/am335x-pru-package/am335x-pru-package.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/am335x-pru-package/am335x-pru-package.mk b/package/am335x-pru-package/am335x-pru-package.mk
index a97e8a49eacb..8b33eb3d6cbf 100644
--- a/package/am335x-pru-package/am335x-pru-package.mk
+++ b/package/am335x-pru-package/am335x-pru-package.mk
@@ -9,6 +9,7 @@ AM335X_PRU_PACKAGE_SITE = $(call github,beagleboard,am335x_pru_package,$(AM335X_
 AM335X_PRU_PACKAGE_LICENSE = BSD-3c
 AM335X_PRU_PACKAGE_LICENSE_FILES = pru_sw/utils/LICENCE.txt
 AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
+HOST_AM335X_PRU_PACKAGE_DEPENDENCIES = host-am335x-pru-package
 AM335X_PRU_PACKAGE_INSTALL_STAGING = YES
 
 # The default 'all' rule builds everything, when we just need the library
-- 
2.1.0
