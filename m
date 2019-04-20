From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 22:24:46 +0200
Subject: [Buildroot] [git commit] package/jemalloc: add or1k support
Message-ID: <20190420202042.DF5118E185@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68bb4be30f370298a4e5292cc86948e2ed026fad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

or1k support has been added since version 4.0.0 and
https://github.com/jemalloc/jemalloc/commit/ffa259841c6a4b6dae4ed74f02bb38703e190065

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jemalloc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index edb582d203..9e87e3ca99 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_or1k
 	default y if BR2_sparc64
 	default y if BR2_powerpc
 	default y if BR2_sh4 || BR2sh4eb || BR2_sh4a || BR2_sh4aeb
