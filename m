From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Jul 2013 00:12:57 +0200
Subject: [Buildroot] [git commit] ext-toolchain-wrapper: fix typo on
	s/BR2_FPU/BR_FPU/
Message-ID: <20130720225941.5A4459A68F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27c9370344692b7605072f51eaf0275654faa093
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../toolchain-external/ext-toolchain-wrapper.c     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index befd735..247df6d 100644
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
