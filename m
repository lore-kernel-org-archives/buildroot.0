From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  3 Mar 2017 07:25:16 +0200
Subject: [Buildroot] [PATCH] protobuf-c: update homepage link
Message-ID: <130b535449bfefc3e56425239fda9ec8a738c08f.1488518716.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/protobuf-c/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index 28555502f95b..a32e6cd9e895 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PROTOBUF_C
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
 
-	  http://code.google.com/p/protobuf-c/
+	  https://github.com/protobuf-c/protobuf-c
 
 comment "protobuf-c needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.11.0
