From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Jan 2011 21:21:16 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain-common.in: Fix
	USE_MMU typo
Message-ID: <20110115202155.B9B9E8A2EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9cce44093bdffcabee3133301fd8caa31e97976b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Marc Gauthier for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-common.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 9106e1f..eb3628a 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -67,7 +67,7 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_MMU
-	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_extensa
+	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
 	default y
 	help
 	  If your target has a MMU, you should say Y here.  If you
-- 
1.7.3.4
