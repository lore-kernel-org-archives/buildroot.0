From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2021 15:07:12 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] {linux,
 linux-headers}: bump 5.{4, 9, 10}.x series
Message-ID: <20210104134924.4CACD82B84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac856e5d0de0ac60f51fc83a17c46974c14b82dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3544983fe4b2ac20ed95070c58a7882248f26bce)
[Peter: drop 5.9.x/5.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 128a8f8cc3..6536def003 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.4.83" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.4.85" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.152-cip37-rt16" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c834b7b7c3..6034df3819 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  beec970bbb93de8ab839f27930f7ab00c7bd65af0ffa07a50e765affdc2561c6  linux-5.4.83.tar.xz
+sha256  1de3586d8e7a9a814726610745d80907a267590d2770ec1079ef2875c4984008  linux-5.4.85.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  e52a49ceb639d871478a143c314648c35e22222c317ecdf49866830fea5c3dfc  linux-4.4.248.tar.xz
 sha256  4687268061c9933c298b30d28e4bf1a30dfbab7c0da4bee194968e4f81ffeccf  linux-4.9.248.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a8a725a3e4..7d894fe6f0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -322,7 +322,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.248"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.212"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.163"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.83"	if BR2_KERNEL_HEADERS_5_4
+	default "5.4.85"	if BR2_KERNEL_HEADERS_5_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
