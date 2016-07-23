From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 23:26:42 +0200
Subject: [Buildroot] [git commit] configs/odroidc2: bump kernel to rev
	1cb48cebb9d525e524de0ede46710bb29f54d4a6
Message-ID: <20160723212652.207677FEEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=583e0e30cab3432c13b5945ce6e90c91554590c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 30fa2d5..43c2787 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="db9b5cfbd380d2316b7723599ee0c7e9d866db17"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1cb48cebb9d525e524de0ede46710bb29f54d4a6"
 BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
