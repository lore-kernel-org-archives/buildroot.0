From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:43:00 +0200
Subject: [Buildroot] [git commit] configs/odroidc2: bump kernel to
	925e508d37c76848881a8c8f7e9b02abc5731d88
Message-ID: <20161007134359.F0EF780468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7de5b0d2d83bec38ec96ef5917259d9f46df58d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

odroidc2's kernel remains based on 3.14. This commit upgrades the kernel
to a new commit that is now based on 3.14.79, and contains a number of
ODroidC2 related bug fixes and feature additions.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 0c8ff3d..44fc61a 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1cb48cebb9d525e524de0ede46710bb29f54d4a6"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="925e508d37c76848881a8c8f7e9b02abc5731d88"
 BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
