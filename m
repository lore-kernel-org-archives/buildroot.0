From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Apr 2012 08:35:11 -0300
Subject: [Buildroot] [PATCH] qemu/ppc-g3beige: target 750 rather than 440fp
Message-ID: <1335440111-12662-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Target a powerpc 750 rather than the incorrect 440fp to avoid issues and
for correctness.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_ppc_g3beige_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index a20d3e4..8f36446 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_powerpc=y
-BR2_powerpc_440fp=y
+BR2_powerpc_750=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
1.7.3.4
