From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:53 -0000
Subject: [Buildroot] [git commit] botan: fix minor typo in Config.in file
Message-ID: <20180907111537.CB8E58151E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=826be91a5d5110a76d6156fddd1593037e38889e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index db2b33dfbe..6fe818bc6d 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, threads,gcc >= 4.8"
+comment "botan needs a toolchain w/ C++, threads, gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
