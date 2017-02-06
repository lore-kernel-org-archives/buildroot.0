From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 14:04:16 +0100
Subject: [Buildroot] [git commit] configs/odroidc2: bump kernel version to
	a7fe6f2258e30c7a547908b5480bdbe6b56d6d3c
Message-ID: <20170206130440.2406581E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab72923a1fb0551ed05b4c09117fc6564482ed24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this kernel rev has numerous bug fixes, framework upgrades and new
features added.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index ecee2ad..f2d8229 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="925e508d37c76848881a8c8f7e9b02abc5731d88"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a7fe6f2258e30c7a547908b5480bdbe6b56d6d3c"
 BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
