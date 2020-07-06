From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  7 Jul 2020 01:41:44 +0200
Subject: [Buildroot] [PATCH 1/8] board/qemu/aarch64-virt/linux.config:
 regenerate after kernel version bump
Message-ID: <20200706234151.2940865-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Regenerate the with savedefconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/aarch64-virt/linux.config | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index c9f2708ad5..948b06b0a2 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -5,13 +5,13 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_TASKSTATS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_PROFILING=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_COMPAT=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
-CONFIG_ARCH_VEXPRESS=y
-CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_BINFMT_MISC=y
-CONFIG_COMPAT=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_PACKET_DIAG=y
-- 
2.25.4
