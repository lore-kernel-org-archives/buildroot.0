From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:55:30 +0100
Subject: [Buildroot] [git commit] linux: enable uBoot image type for xtensa
	kernel
Message-ID: <20170314205535.18AF8825B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd5b71af7cbb08d9452c929c8a8d5fc0420d94d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with the release 2016.09 xtensa architecture is supported by
the U-Boot. Enable uimage target in xtensa linux kernel.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1707f7d..2248f09 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -179,7 +179,7 @@ config BR2_LINUX_KERNEL_UIMAGE
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
 		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
 		   BR2_sh || BR2_mips || BR2_mipsel || \
-		   BR2_mips64 || BR2_mips64el
+		   BR2_mips64 || BR2_mips64el || BR2_xtensa
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
 config BR2_LINUX_KERNEL_APPENDED_UIMAGE
