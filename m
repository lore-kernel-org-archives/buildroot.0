From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Dec 2018 21:54:29 +0100
Subject: [Buildroot] [git commit] configs/liteboard: remove explicit getty
 port
Message-ID: <20181209205212.0CB1C8B86B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=659a0fb88e7aea23ff5b2f7115a7c5903594c538
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using default value (console) works well, so there is no reason to set
tty explicitly.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/grinn_liteboard_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index 5f3ca07552..84f1735e22 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -1,7 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/liteboard/post-image.sh"
 BR2_LINUX_KERNEL=y
