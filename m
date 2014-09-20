From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:54:59 +0200
Subject: [Buildroot] [PATCH 01/15 v2] package/linux-firmware: bump revision
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <393498f0e3374623a6059c843dc59b6857b4c1d9.1411246411.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some updated firmwares files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: entries for new firmware files will come in follow-up patches.
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index aa87c73..43edf64 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 4a050f5524a09c35192273e3a5d741f63e7bf7d6
+LINUX_FIRMWARE_VERSION = f66291398181d24856fd2d19454d246199abd5ea
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
1.9.1
