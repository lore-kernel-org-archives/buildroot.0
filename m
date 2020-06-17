From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 20:57:43 +0200
Subject: [Buildroot] [git commit] board/olpc: move GPIO_SYSFS to common
 config
Message-ID: <20200617190503.0492A7FEBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e63e057f2705999da9e820d330d9b670d620cf0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's not specific to XO-1.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olpc/linux.config      | 1 +
 board/olpc/xo-1/linux.config | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olpc/linux.config b/board/olpc/linux.config
index 4ba157cf0b..01de870730 100644
--- a/board/olpc/linux.config
+++ b/board/olpc/linux.config
@@ -21,6 +21,7 @@ CONFIG_BLK_DEV_SR=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
+CONFIG_GPIO_SYSFS=y
 CONFIG_NETDEVICES=y
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 8ed10ff62b..0680e073cb 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -44,7 +44,6 @@ CONFIG_NVRAM=y
 CONFIG_SCx200_ACB=y
 CONFIG_PINCTRL=y
 CONFIG_PINCTRL_SINGLE=y
-CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_CS5535=y
 CONFIG_THERMAL=y
 CONFIG_WATCHDOG=y
