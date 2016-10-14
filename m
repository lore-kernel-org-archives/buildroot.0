From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 18:46:01 +0200
Subject: [Buildroot] [git commit] configs/odroidc2: bump kernel headers to
	3.14.79
Message-ID: <20161014164627.EDCF182269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=366cec113a1c5a20b4afb671d14f02ea10b660e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

following commit 7de5b0d2d83bec38ec96ef5917259d9f46df58d4, bump kernel
headers to 3.14.79 to match the kernel version.

We cannot use BR2_KERNEL_HEADERS_AS_KERNEL as some of their kernel
modifications causes glibc to fail to build.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/odroidc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 44fc61a..95a9169 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -11,7 +11,7 @@ BR2_GCC_VERSION_4_9_X=y
 
 # Kernel
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.29"
+BR2_DEFAULT_KERNEL_VERSION="3.14.79"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
