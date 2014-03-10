From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 22:24:14 +0100
Subject: [Buildroot] [PATCH 2/5] package/linux-firmware: bump for new
	firmwares
In-Reply-To: <cover.1394486562.git.yann.morin.1998@free.fr>
References: <cover.1394486562.git.yann.morin.1998@free.fr>
Message-ID: <c7bfaed44a5269a7d07265f2e1020a998fb7ef48.1394486562.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

A bunch of new WiFi firmwares has been added, some have been updated.
Not limited to WiFi, but other firmwares are of less interest to
Buildroot for now (eg. radeon, myri10ge...).

Fixups in WHENCE file (the all-licenses file).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 45c82c6..307e8ee 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 52d77db9f133afe4d2b26aeccfd603745f45fda1
+LINUX_FIRMWARE_VERSION = f8c22c692bdee57a20b092e647464ff6176df3ed
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
1.8.3.2
