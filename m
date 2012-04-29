From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 20:44:29 +0200
Subject: [Buildroot] [git commit] qemu/ppc-g3beige: target 750 rather than
	440fp
Message-ID: <20120429184454.799C596BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0242ae4c6b7d1daf85a5f0c191394b0a15f95c54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Target a powerpc 750 rather than the incorrect 440fp to avoid issues and
for correctness.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
