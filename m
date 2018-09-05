From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 21:39:14 +0200
Subject: [Buildroot] [git commit branch/next] systemd: enable on the ARC
 architecture
Message-ID: <20180905193859.8438882875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f93596d8ba82354efb545fe91449627e6c896ce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ARC port was merged in v234, see
https://github.com/systemd/systemd/commit/27b09f1f1ed29edb9c52ad8414c2344974a07a23

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 1cc0021b87..c858d89c05 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 		BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
 		BR2_powerpc64le || BR2_sh4 || BR2_sh4eb || \
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
-		BR2_aarch64 || BR2_m68k
+		BR2_aarch64 || BR2_m68k || BR2_arc
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
