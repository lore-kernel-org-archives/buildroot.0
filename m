From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 16:04:13 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] {linux,
 linux-headers}: bump 4.{9, 14, 19, 20}.x series
Message-ID: <20190124152040.D88098E4A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ca9600c96f83ff56b0dba77c6488930111b51f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 78f0c1fe4a3d7f621707c20eeee16dc77b4a1a15)
[Peter: drop 4.19.x/4.20.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 80ec74e111..f04d6927fa 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 6a587c8b4160918efa082b0c2eda8c2db0f50d8814ad1d1ac94be1edf66ca6a9  linux-4.14.91.tar.xz
-sha256 6067151b0225a8de1ab79abc9be7bae237eaca0cd838eb26684169560d88a994  linux-4.9.148.tar.xz
+sha256 5f9f1faba9a47e406de9b207d45a00d41d45e11615971ec9ef9493654cd745ad  linux-4.14.92.tar.xz
+sha256 165bd3b42e8f99e62238f711d2c0100ad411bc69588c65fb3a22c190dc35d783  linux-4.9.149.tar.xz
 sha256 06f1b080332251628727e42d21b4530035f03f00d75432199b2548172b1650a9  linux-4.4.169.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f9117d34da..21fa5fd4dd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -291,8 +291,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.169"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.148"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.91"	if BR2_KERNEL_HEADERS_4_14
+	default "4.9.149"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.92"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
