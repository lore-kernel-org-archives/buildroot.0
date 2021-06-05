From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 14:43:36 +0200
Subject: [Buildroot] [git commit] package/efibootmgr: fix comment
Message-ID: <20210605121332.F3B1380E11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7d6149b681d4bf4eccdbafe7deee394e075f607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building efibootmgr with a musl toolchain is possible.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/efibootmgr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index d31f9b13ee..98ff71c996 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhboot/efibootmgr
 
-comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efibootmgr needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
