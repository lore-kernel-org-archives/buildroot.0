From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Feb 2016 22:19:54 +0100
Subject: [Buildroot] [git commit] toolchain-external/Config.in: Fix Linaro
	typo
Message-ID: <20160221212027.94D7480826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0c3d7d6c9d4e78fd5b4e3c70b8119217370a02a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7ba3929..2ee4c0f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -526,7 +526,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-# See note about Linar ARM/ARMEB toolchains, above.
+# See note about Linaro ARM/ARMEB toolchains, above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
@@ -541,7 +541,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
-# See note about Linar ARM/ARMEB toolchains, above.
+# See note about Linaro ARM/ARMEB toolchains, above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2015.11"
 	depends on BR2_aarch64
