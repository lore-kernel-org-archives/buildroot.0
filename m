From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:47:55 +0200
Subject: [Buildroot] [git commit branch/next] qemu-sparc64: update kernel
Message-ID: <20170809225749.7BB5380124@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cbfab1c20851220345f692f3968163e824b1ceb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fixes '__multi3' issue when building the kernel.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/qemu_sparc64_sun4u_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 1f4df06..072fba7 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -15,6 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.11.config"
