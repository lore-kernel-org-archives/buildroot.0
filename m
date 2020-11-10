From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 08:40:37 +0100
Subject: [Buildroot] [git commit] linux: bump CIP kernel to version
 4.19.152-cip37
Message-ID: <20201110073013.1592F81682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18729f8d64636db2ddc68d5d94ec10f19021cde7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP to version 4.19.152-cip37

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 64efc20394..7493030d7b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.9)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.132-cip30)"
+	bool "Latest CIP SLTS version (4.19.152-cip37)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -126,8 +126,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.9.6" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index a12192c137..cf592c6feb 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,7 +8,7 @@ sha256  c4c6d04f91d881e68524bda6062b5c1835f285bd03344bf8f2eaeef3394bb32c  linux-
 sha256  9e832899ec75dbfce393c9f7a07df24183b28f0bb95ad4dd8b1fa027bc668ad9  linux-4.14.204.tar.xz
 sha256  cbc648f5405cb2b554b7a0f23885742d9969a11d22692287ee756adf940a48d2  linux-4.19.155.tar.xz
 # Locally computed
-sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
+sha256  d2a06f52143deb929b8d513cf9afc9bd065951389a80fa70bc4d63025b5b3fb9  linux-cip-4.19.152-cip37.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
 
 # Licenses hashes
