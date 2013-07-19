From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 19 Jul 2013 18:31:57 -0500
Subject: [Buildroot] [PATCH v3 1/2] ext-toolchain-wrapper: fix typo on
	s/BR2_FPU/BR_FPU/
Message-ID: <1374276718-14000-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 toolchain/toolchain-external/ext-toolchain-wrapper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index 460f255..dc473be 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -41,7 +41,7 @@ static char *predef_args[] = {
 #ifdef BR_FLOAT_ABI
 	"-mfloat-abi=" BR_FLOAT_ABI,
 #endif
-#ifdef BR2_FPU
+#ifdef BR_FPU
 	"-mfpu=" BR_FPU,
 #endif
 #ifdef BR_SOFTFLOAT
-- 
1.8.1.2
