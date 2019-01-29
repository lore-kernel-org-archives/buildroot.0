From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 20:18:38 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] {linux,
 linux-headers}: bump 4.{9, 14, 19, 20}.x series
Message-ID: <20190129191928.1D1A18151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be2a74c71555ba1e1abdbe5105833d6fd4170d9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9a76fd4dd6960b072bbb03911ee7662d86241d21)
[Peter: drop 4.19.x/4.20.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 1e5d76d5ac..7612290853 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 68ac319e0fb7edd6b6051541d9cf112cd4f77a29e16a69ae1e133ff51117f653  linux-4.18.20.tar.xz
 sha256 41026d713ba4f7a5e9d514b876ce4ed28a1d993c0c58b42b2a2597d6a0e83021  linux-4.16.18.tar.xz
-sha256 e728518bb024209acc222e803cdc00d0ea2b1f4ebf28a8ed17a639171a1c23f1  linux-4.14.94.tar.xz
-sha256 15965595807e4dce34da951a806af9928b60c19d3f40773de43f606f14ed425c  linux-4.9.151.tar.xz
+sha256 ce6729e3fca312520e3cb4f27993852dbb019d94c59c0b35cedab571f9cb58e4  linux-4.14.95.tar.xz
+sha256 90e47b85c09af47eefafe851685ee731538f640b0650a6a9cfa0234436708e39  linux-4.9.152.tar.xz
 sha256 fd4074da2a946368292b04c44241de37f6b30a10f4231673d0689cf6454fefa0  linux-4.4.171.tar.xz
 sha256 6ad9389e55e0ea57768eae173747058a4487fa3630e10a7999cfec9f945e559c  linux-4.1.52.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 810dd5de52..79bf78f2e9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -291,8 +291,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.171"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.151"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.94"	if BR2_KERNEL_HEADERS_4_14
+	default "4.9.152"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.95"	if BR2_KERNEL_HEADERS_4_14
 	default "4.16.18"	if BR2_KERNEL_HEADERS_4_16
 	default "4.18.20"	if BR2_KERNEL_HEADERS_4_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
