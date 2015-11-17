From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Nov 2015 13:37:13 -0300
Subject: [Buildroot] [PATCH 2/3] configs/qemu: fix networking for sparc64
In-Reply-To: <1447778234-14246-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447778234-14246-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1447778234-14246-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It contained a typo that prevented the driver from being built.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/sparc64-sun4u/linux-4.3.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.4.10
