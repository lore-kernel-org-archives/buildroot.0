From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 11:29:43 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] linux: bump CIP RT kernel
 to version 4.19.132-cip30-rt12
Message-ID: <20200813092521.D10678264C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b442ccb43e4e38babd1d6c1c899317487dc9d4f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This patch bumps Linux CIP RT to version 4.19.132-cip30-rt12

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c009545716b8bef726e5353e8071a4061af91cec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in  | 4 ++--
 linux/linux.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f4de414433..a5156a19e4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -49,7 +49,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.115-cip24-rt9)"
+	bool "Latest CIP RT SLTS version (4.19.132-cip30-rt12)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -130,7 +130,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.45" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.115-cip24-rt9" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 3ca616b1c5..6ecb65b206 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -7,7 +7,7 @@ sha256  4265afef56819b04656107a5abecde205c5bc5fb04b2e81447955e7e45db8085  linux-
 sha256  82af886bc588b5c8d7474beb2bac13810ee3ed07da356a2553c81ae8e52e586f  linux-4.19.127.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
-sha256  7f0a0db0e1cfb14053523f4432f1ad1468b5bd42305b44905c4b103466c8d655  linux-cip-4.19.115-cip24-rt9.tar.gz
+sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
 
 # Licenses hashes
 sha256  ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff  COPYING
