From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Aug 2014 22:52:17 +0200
Subject: [Buildroot] [git commit branch/next] nitrogen6x_defconfig: bump
	u-boot to version 63ae4a5
Message-ID: <20140811205327.8071F9D3E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb34fe9af3b57ed6c11a5d8d3d3a768f4651aa44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump u-boot to latest version binary provided by Boundary Devices ([1]).

This version is only 6 commits behind the head of the git production
branch ([2]) recommended by Boundary Devices ([3]).

Tested on nitrogen6q-rev3 board.

[1] http://commondatastorage.googleapis.com/boundarydevices.com/u-boot-production.tar.gz
[2] https://github.com/boundarydevices/u-boot-imx6/commits/production
[3] http://boundarydevices.com/i-mx6-frequently-asked-questions-and-answers/#latest-uboot

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nitrogen6x_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 082b1f5..5e5b91e 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -16,7 +16,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/4034391/u-boot-4034391.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/63ae4a5/u-boot-63ae4a5.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
