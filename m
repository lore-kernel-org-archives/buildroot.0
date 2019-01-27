From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 10:50:29 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19, 20}.x series
Message-ID: <20190127095108.A1CC183BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c331187744a91571d8be20e7fff870a3fc062db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7c7263a101..4f6ae2e9ee 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.17" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index b25f9774a2..ba67e10c61 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 dd7fd7eafb8f94a3813a6398d5d2720422a80c933d0dc076479e5c58ecfd34d1  linux-4.20.4.tar.xz
-sha256 872d92a17a2d252ccd6334503bc8f67eebceeb99cb822a77f5c72b936f2ccb59  linux-4.19.17.tar.xz
-sha256 ce6729e3fca312520e3cb4f27993852dbb019d94c59c0b35cedab571f9cb58e4  linux-4.14.95.tar.xz
-sha256 90e47b85c09af47eefafe851685ee731538f640b0650a6a9cfa0234436708e39  linux-4.9.152.tar.xz
-sha256 fd4074da2a946368292b04c44241de37f6b30a10f4231673d0689cf6454fefa0  linux-4.4.171.tar.xz
+sha256 ff8d96974a947a6332b3a2dda461c1b2df8175b56fa4ab9398224e6e1800e214  linux-4.20.5.tar.xz
+sha256 5ffdc068f9bf768b7cd5a8a2271d1370c2326e967848b13e21dfdbb1ef0ff3f1  linux-4.19.18.tar.xz
+sha256 110daeae1a416b7e0ec8dce5e86d67552deeb4567f696c3869389be239f0ecb5  linux-4.14.96.tar.xz
+sha256 9066929ec2550794ae107350a5f3c5b648438aa915cfc62bac5b7a54b9d7731a  linux-4.9.153.tar.xz
+sha256 fb4d16b3c1e508dfa0344e406caeb25286d1c258421d8891b5580323e4e639fb  linux-4.4.172.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 92db2975c8..a6055e75b9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,11 +287,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.171"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.152"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.95"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.17"	if BR2_KERNEL_HEADERS_4_19
-	default "4.20.4"	if BR2_KERNEL_HEADERS_4_20
+	default "4.4.172"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.153"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.96"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.18"	if BR2_KERNEL_HEADERS_4_19
+	default "4.20.5"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
