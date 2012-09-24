From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Sep 2012 21:38:52 +0200
Subject: [Buildroot] [PATCH] external-toolchain:
	BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
Message-ID: <1348515532-4855-1-git-send-email-baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain-external/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f86ed74..911fea4 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -664,7 +664,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
-	bool "glibc"
+	bool "glibc/eglibc"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 
 endchoice
-- 
1.7.10.4
