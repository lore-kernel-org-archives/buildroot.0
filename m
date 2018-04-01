From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:10:44 +0200
Subject: [Buildroot] [git commit] qemu/Config.in.host: fix overindented
 depends on
Message-ID: <20180401071046.5DFD97FCF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9b9ad206a3d3afaae90cf5dab9f909432645aff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do the same as used in all other Config.in files and use only one tab.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index bbc2aa27c5..0ef4c700b0 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 		BR2_mips64       || BR2_mips64el    || BR2_powerpc      || \
 		BR2_powerpc64    || BR2_powerpc64le || BR2_sh           || \
 		BR2_sparc        || BR2_x86_64
-		depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
+	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
