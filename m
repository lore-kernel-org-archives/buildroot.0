From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Oct 2014 23:51:14 +0200
Subject: [Buildroot] [git commit] configs/qemu-ppc-virtex-ml507: remove
	stray qemu-system entries
Message-ID: <20141024230432.0FDF1B581D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f688bc980f862f8c03e9756e767a822afc9a5f21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed unused config entries that sneaked in from commit
a8956b2b53cad04ddcb56f3d3e2dcf8f6051c77a

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_ppc_virtex_ml507_defconfig |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index bd7ab5c..b6cea31 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -22,8 +22,3 @@ BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
-
-# Qemu
-BR2_PACKAGE_HOST_QEMU_SYSTEM=y
-BR2_PACKAGE_HOST_QEMU_SYSTEM_VERSION="2.1.2"
-BR2_PACKAGE_HOST_QEMU_SYSTEM_ARGS="-M virtex-ml507 -kernel output/images/vmlinux -m 256 -append 'console=ttyS0' -display none -nographic -dtb output/images/virtex440-ml507.dtb"
