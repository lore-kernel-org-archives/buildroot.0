From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:20:48 +0100
Subject: [Buildroot] [git commit] configs/qemu: fix networking for sparc64
Message-ID: <20151117202100.505ED7FF9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd5f8b25d4c80b26a195204e75407a7c0e12f7e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It contained a typo that prevented the driver from being built.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/sparc64-sun4u/linux-4.3.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/board/qemu/sparc64-sun4u/linux-4.3.config b/board/qemu/sparc64-sun4u/linux-4.3.config
index 7eda705..0e1e168 100644
--- a/board/qemu/sparc64-sun4u/linux-4.3.config
+++ b/board/qemu/sparc64-sun4u/linux-4.3.config
@@ -15,7 +15,7 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_PATA_CMD64X=y
 CONFIG_NETDEVICES=y
-CONFIG_E1000_PCI=y
+CONFIG_E1000=y
 CONFIG_SERIAL_SUNSU=y
 CONFIG_SERIAL_SUNSU_CONSOLE=y
 CONFIG_EXT4_FS=y
