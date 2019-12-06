From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 22:30:23 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{3, 4}.x series
Message-ID: <20191206212203.31AC28845D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2135e3da387a938f316557ab87a55a8b4a2acaba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d1ebfee130..13bd21a62c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.82-cip14" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.72-cip10-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index dfd66461d2..5eb4307bf5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 955712688c7256675383ec5be4ee044dbb59116a9a1f24e8689d12a6f95f7932  linux-5.3.14.tar.xz
-sha256 a7d48bb324d53e421ffbe4da40087b3c0c5112707e5f3d827c30118542c74fd9  linux-5.4.1.tar.xz
+sha256 cec8aaea89feac4a3555f1e4b90000244ff7c5e7640db242a7de796a006d1197  linux-5.3.15.tar.xz
+sha256 32f98256877ca6b016715ffffcf184f1603df9e17a324787f252cd602e03a557  linux-5.4.2.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 fa1f8fe9c12e18e5cda18cf759b77ae9e778e1e9006d837426c955b75bd4eaa6  linux-4.4.205.tar.xz
-sha256 98b9e8644706acc0cf51022372bb263b59a1d2bbe3ccd7ce6bd9bc7378c78b05  linux-4.9.205.tar.xz
-sha256 90fa769a052ecf34a0cab72cf013e19275dbb8cd01bbe52f1d465e2ed7537733  linux-4.14.157.tar.xz
-sha256 a57221e8318e6fcaedb90b099d56352f9d6608fd367283bc7db84330856eda1d  linux-4.19.87.tar.xz
+sha256 5da5e16fe08fa506f8f74aa4f17be22b52c0f513e9a3f7e7ae22fc53597ad493  linux-4.4.206.tar.xz
+sha256 1df27899a9bc4dd874f3830ab9e7b638f0026dffd67a2e230444e5d2805ccad6  linux-4.9.206.tar.xz
+sha256 0d49ec72e273f6fc7462ad56849b2285f13fd5f4185e8f932a0074fc2eca1bb3  linux-4.14.158.tar.xz
+sha256 c1923b6bd166e6dd07be860c15f59e8273aaa8692bc2a1fce1d31b826b9b3fbe  linux-4.19.88.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a42d29ce2d..2574792afb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -313,12 +313,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.205"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.205"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.157"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.87"	if BR2_KERNEL_HEADERS_4_19
-	default "5.3.14"	if BR2_KERNEL_HEADERS_5_3
-	default "5.4.1"		if BR2_KERNEL_HEADERS_5_4
+	default "4.4.206"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.206"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.158"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.88"	if BR2_KERNEL_HEADERS_4_19
+	default "5.3.15"	if BR2_KERNEL_HEADERS_5_3
+	default "5.4.2"		if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
