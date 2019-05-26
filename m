From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:07:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.0.x series
Message-ID: <20190526091607.A74018149A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55ea12c13c1fbed67f534de942444e5ad3368c02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6606f6c6a1e715e76e0022fdd46edcbcacff8f13)
[Peter: drop 5.0.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 570c5a1dd5..bbff4e9df3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.40" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.41" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 9323a698a9..3803eb1a0f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 6fd8cd4d8a15d7bfb4a7968fbe104f97f8c5ff557c752aae43fe13a6ca073fb0  linux-4.19.40.tar.xz
-sha256 a05afa95163eab4ec76dabb51f54aea8c40ef63d5ea2d112ac04e6b79a8e8dbd  linux-4.14.116.tar.xz
-sha256 bc579d904f7d7d04adf03ed66dc8ac0a29d6cc74d989d3aa5c6ae2dedaf51168  linux-4.9.173.tar.xz
+sha256 90de6296504c64cbc4147fe053a1e8f88a98b7aed7896777e33a0321d0714782  linux-4.19.41.tar.xz
+sha256 a855a134e7a77dff92ad50f20501dbb39a1ee011ffa781ed885a3d17c6b9f23f  linux-4.14.117.tar.xz
+sha256 fc84fd68077fff55bb1779fbf3ee916257a4362a8e6d982773856c78f7865858  linux-4.9.174.tar.xz
 sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cb51b461cb..ce7f20406b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -288,9 +288,9 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.173"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.116"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.40"	if BR2_KERNEL_HEADERS_4_19
+	default "4.9.174"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.117"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.41"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
