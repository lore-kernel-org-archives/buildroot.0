From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 2 Aug 2015 23:39:32 +0200
Subject: [Buildroot] [PATCH 2/3] toolchain: add mips64 for uClibc-ng
Message-ID: <20150802213932.GA23554@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 toolchain/toolchain-buildroot/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 13e2b15..6d74819 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -24,7 +24,7 @@ choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_UCLIBC
 	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_aarch64 || BR2_aarch64_be \
-		|| BR2_microblaze || BR2_mips64 || BR2_mips64el || BR2_powerpc64
+		|| BR2_microblaze || BR2_powerpc64
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
-- 
1.7.10.4
