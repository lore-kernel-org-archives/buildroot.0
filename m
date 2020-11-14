From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 08:56:03 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 8, 9}.x series
Message-ID: <20201114075115.8330F821F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3725f7a8318a7a8201bed1a047d7d3ded8cba60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 493b1d7b254a881a3eff43e818cefb3ddc917a8f)
[Peter: drop 5.8.x/5.9.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 69e778c46a..fee8dcefc5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  419c6248b9ae4dfead4599787aecbfd202e88bc4124523adfa6dd2d642b99fe7  linux-5.7.19.tar.xz
-sha256  c0b3d8085c5ba235df38b00b740e053659709e8a5ca21957a239f6bc22c45007  linux-5.4.70.tar.xz
+sha256  d2466fd6eb5433e7bf287b617b11b2640c65a7ea93a57eb7a80d7f537cbc1470  linux-5.4.75.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  067814035c17e77dee84076dcc06a95eb675344cd926b7b79a16b80fee593364  linux-4.4.238.tar.xz
-sha256  b1eaf60b771ec4df0546d2b7539e164355008ea2f680a0642ae430e9cb134a3f  linux-4.9.238.tar.xz
-sha256  5d404a0224a34b5379f1871cc46825487d557c2660459d2b5c3cd4871d699a38  linux-4.14.200.tar.xz
-sha256  f2f709ef086a4d8cb3c15a857daa44dfecf1b88d7d7c53c980fb180f6dccbace  linux-4.19.150.tar.xz
+sha256  32fe14f120436c927d895d3c59a37ca50c0ae3648ba3599d9cab57ffa4699214  linux-4.4.241.tar.xz
+sha256  c4c6d04f91d881e68524bda6062b5c1835f285bd03344bf8f2eaeef3394bb32c  linux-4.9.241.tar.xz
+sha256  9e832899ec75dbfce393c9f7a07df24183b28f0bb95ad4dd8b1fa027bc668ad9  linux-4.14.204.tar.xz
+sha256  cbc648f5405cb2b554b7a0f23885742d9969a11d22692287ee756adf940a48d2  linux-4.19.155.tar.xz
 # Locally computed
 sha256  c20f9014b89ea3e27f55f1d407aa5a4724ed38ac520c197291e9d644f164c43a  linux-cip-4.19.132-cip30.tar.gz
 sha256  81dd791d9ad6c3fddaeaffc6d7d8df0e13831283a5fe494c437ac7820d79ca39  linux-cip-4.19.132-cip30-rt12.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 68334ed8c8..32f5e41d1e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -334,11 +334,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.238"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.238"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.200"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.150"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.70"	if BR2_KERNEL_HEADERS_5_4
+	default "4.4.241"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.241"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.204"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.155"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.75"	if BR2_KERNEL_HEADERS_5_4
 	default "5.7.19"	if BR2_KERNEL_HEADERS_5_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
