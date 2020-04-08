From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Apr 2020 00:00:40 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 5.{4, 5, 6}.x series
Message-ID: <20200409055853.5B4618E198@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c2319a1d51abcc8fcf2f48c9853f0038668c8c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b27a07ceb6c8cabf521dcf68846468cd245202cb)
[Peter: drop 5.5.x / 5.6.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 43fcbea157..c367b33378 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.30" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.31" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0c3daa432d..f6bad5c8ec 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  11dd78f701bce619d90d3b2ee597601716c48087e159c890c1decd7b90349def  linux-5.4.30.tar.xz
+sha256  a11083f8f809887f6a0f8d4467532385b99418f17998fe6e837807491c276eeb  linux-5.4.31.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  ea68cb8e9fa255bb1d0402c5aa8f26984f9b1c8607ff3bed5d3284109167f063  linux-4.4.218.tar.xz
 sha256  df3a6e615ec4c57b04775e9c018c67045223ac662e696d28fd37baa5114349cd  linux-4.9.218.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8a12889ec0..fde769e6a3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -322,7 +322,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.218"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.175"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.114"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.30"	if BR2_KERNEL_HEADERS_5_4
+	default "5.4.31"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
