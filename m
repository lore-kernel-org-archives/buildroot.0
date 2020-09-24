From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:56:23 +0200
Subject: [Buildroot] [git commit] package/cmake: add support for IBM s390x
 and Z arch
Message-ID: <20200924213039.DF22B83786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efc6e1e290db55fe8121d70c3b0aae896c6b01f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cmake/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index e7bd14e69a..3c47fdcb49 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 		BR2_m68k      || BR2_mips        || BR2_mips64   || \
 		BR2_mipsel    || BR2_mips64el    || BR2_powerpc  || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc    || \
-		BR2_i386      || BR2_x86_64      || BR2_xtensa
+		BR2_i386      || BR2_x86_64      || BR2_xtensa   || \
+		BR2_s390x
 
 config BR2_PACKAGE_CMAKE
 	bool
