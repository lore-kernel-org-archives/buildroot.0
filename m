From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:40:07 +0100
Subject: [Buildroot] [git commit] protobuf-c: update homepage link
Message-ID: <20170303074059.D07FA81D4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7575ea6982f9bbdbbfaf147283b1dd63a6f0eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf-c/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index 2855550..a32e6cd 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PROTOBUF_C
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
 
-	  http://code.google.com/p/protobuf-c/
+	  https://github.com/protobuf-c/protobuf-c
 
 comment "protobuf-c needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
