From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 23:11:12 +0100
Subject: [Buildroot] [git commit] toolchain/external: fix SSP help texts for
 custom toolchains
Message-ID: <20200220220016.D60B58E605@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd99af3742ae16619d971b65f9f03dfccdd31734
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index c8cd2c03cc..8c38dd9fcd 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -405,7 +405,7 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	default y if BR2_TOOLCHAIN_EXTERNAL_MUSL
 	select BR2_TOOLCHAIN_HAS_SSP
 	help
-	  Selection this option if your external toolchain has Stack
+	  Select this option if your external toolchain has Stack
 	  Smashing Protection support enabled. If you don't know,
 	  leave the default value, Buildroot will tell you if it's
 	  correct or not.
@@ -417,7 +417,7 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG
 	depends on BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_SSP_STRONG
 	help
-	  Selection this option if your external toolchain has strong
+	  Select this option if your external toolchain has strong
 	  Stack Smashing Protection support enabled. If you don't
 	  know, leave the default value, Buildroot will tell you if
 	  it's correct or not.
