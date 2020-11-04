From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Nov 2020 08:31:23 +0100
Subject: [Buildroot] [git commit] package/grpc: add host gcc >= 4.9 comment
Message-ID: <20201104072057.36DBD81886@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad89878c6f1d639f921c4ba15f71dcc2222fc99a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e98610f039b88a5d164b19343d5ecef2d1c01f6d forgot to update comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grpc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 6151f4b3d1..d1bf0d078d 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9"
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
