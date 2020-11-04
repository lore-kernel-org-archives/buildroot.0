From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  4 Nov 2020 07:36:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/grpc: add host gcc >= 4.9 comment
Message-ID: <20201104063637.3349-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit e98610f039b88a5d164b19343d5ecef2d1c01f6d forgot to update comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.28.0
