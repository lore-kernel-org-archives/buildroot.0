From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 14:59:58 +0100
Subject: [Buildroot] [git commit] qemu/sparc-ss10: switch to v8 optimization
Message-ID: <20130102140022.9ECAD9A5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5406b810d032efbabd09e767c16324b912750d46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to generic V8 optimization for gcc since we dropped the explicit
supersparc one and works just the same.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/qemu_sparc_ss10_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 38bf243..0b65866 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -1,6 +1,6 @@
 # Architecture
 BR2_sparc=y
-BR2_sparc_supersparc=y
+BR2_sparc_v8=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
