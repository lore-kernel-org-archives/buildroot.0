From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:57:55 +0200
Subject: [Buildroot] [git commit] package/kexec: add support for IBM s390x
 and Z arch
Message-ID: <20200924213040.0150880E36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fbc3f8dd8d074cad258bf1fc8efc602f037c07c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kexec/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 410e503d9e..90a7bc2672 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_KEXEC
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		BR2_sh4 || BR2_sh4a || BR2_aarch64
+		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
