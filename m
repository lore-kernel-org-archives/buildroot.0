From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:56:09 +0200
Subject: [Buildroot] [git commit] package/systemd: add support for IBM s390x
 and Z arch
Message-ID: <20200924213039.D38F781F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faf4e982fdca17e825c5bba00455b65a059290b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 74029aff05..7956370b83 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	default y if BR2_riscv
 	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
 	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_s390x
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
