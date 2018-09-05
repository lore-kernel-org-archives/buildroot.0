From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed,  5 Sep 2018 11:35:26 +0300
Subject: [Buildroot] [PATCH] systemd: Declare support of ARC architecture
Message-ID: <20180905083526.6958-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC port was merged in v234, see
https://github.com/systemd/systemd/commit/27b09f1f1ed29edb9c52ad8414c2344974a07a23

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
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
-- 
2.16.2
