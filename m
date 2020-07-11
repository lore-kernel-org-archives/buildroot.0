From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:51:39 +0200
Subject: [Buildroot] [git commit] board/qemu/aarch64-virt/linux.config:
 regenerate after kernel version bump
Message-ID: <20200711135056.14479866FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e933fd5f8fb1f64ab92fd6c006a1f13f51cc5a05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Regenerate the with savedefconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
