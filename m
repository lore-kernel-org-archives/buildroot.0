From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 22:24:52 +0200
Subject: [Buildroot] [git commit] package/jemalloc: add riscv support
Message-ID: <20190420202042.F09B9814A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b336f9d7955bcadd771dcbee659a9af4a0d3ab65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

riscv support has been added in version 4.2.0 with
https://github.com/jemalloc/jemalloc/commit/919e4a0ea92fbbf9b97efdf9f31a3c800f77cd8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jemalloc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index 9e87e3ca99..a320ae721d 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	default y if BR2_or1k
 	default y if BR2_sparc64
 	default y if BR2_powerpc
+	default y if BR2_riscv
 	default y if BR2_sh4 || BR2sh4eb || BR2_sh4a || BR2_sh4aeb
 
 config BR2_PACKAGE_JEMALLOC
