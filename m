From: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Date: Wed, 12 Jul 2017 14:31:03 -0400
Subject: [Buildroot] [PATCH 1/1] configs/arcturus_ucp1020_defconfig
Message-ID: <20170712183103.30139-1-oleks@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Back to the BR2_GCC_VERSION_4_9_X, because the default/latest GCC fails to build the Linux kernel.

Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
---
 configs/arcturus_ucp1020_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/arcturus_ucp1020_defconfig b/configs/arcturus_ucp1020_defconfig
index cc1297ce1..29e0f766b 100644
--- a/configs/arcturus_ucp1020_defconfig
+++ b/configs/arcturus_ucp1020_defconfig
@@ -10,6 +10,7 @@ BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
+BR2_GCC_VERSION_4_9_X=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.11.0
