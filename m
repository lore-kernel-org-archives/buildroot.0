From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 22:49:43 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{9, 14, 19,
 20}.x series
Message-ID: <20190123215313.EA6A0813FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a76fd4dd6960b072bbb03911ee7662d86241d21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1a50958ea1..7c7263a101 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 9770bcd3da..b25f9774a2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 b9c1bd128404a8e73b57f764256fcaca8eb09f9a892e292856dbeffafa187f45  linux-4.20.3.tar.xz
-sha256 d8a088381fe3e7e5484c060dabcdda4b053ef7114f91cfd56db003a89bb11bdf  linux-4.19.16.tar.xz
-sha256 e728518bb024209acc222e803cdc00d0ea2b1f4ebf28a8ed17a639171a1c23f1  linux-4.14.94.tar.xz
-sha256 15965595807e4dce34da951a806af9928b60c19d3f40773de43f606f14ed425c  linux-4.9.151.tar.xz
+sha256 dd7fd7eafb8f94a3813a6398d5d2720422a80c933d0dc076479e5c58ecfd34d1  linux-4.20.4.tar.xz
+sha256 872d92a17a2d252ccd6334503bc8f67eebceeb99cb822a77f5c72b936f2ccb59  linux-4.19.17.tar.xz
+sha256 ce6729e3fca312520e3cb4f27993852dbb019d94c59c0b35cedab571f9cb58e4  linux-4.14.95.tar.xz
+sha256 90e47b85c09af47eefafe851685ee731538f640b0650a6a9cfa0234436708e39  linux-4.9.152.tar.xz
 sha256 fd4074da2a946368292b04c44241de37f6b30a10f4231673d0689cf6454fefa0  linux-4.4.171.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 88373aee6f..92db2975c8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -288,10 +288,10 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.171"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.151"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.94"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.16"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20.3"	if BR2_KERNEL_HEADERS_4_20
+	default "4.9.152"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.95"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.17"	if BR2_KERNEL_HEADERS_4_19
+	default "4.20.4"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
