From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  9 May 2019 09:46:53 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{9, 14,
 19}.x / 5.0.x series
Message-ID: <20190509074654.3957-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4875454195..af3c9115f2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,7 +121,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.0.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.0.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 549b4d5351..fae7c04cd9 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 d06a7be6e73f97d1350677ad3bae0ce7daecb79c2c2902aaabe806f7fa94f041  linux-5.1.tar.xz
-sha256 bcfd52bf1faa24f5f712146a873959461e001656ad67717e80b947aa6ad53479  linux-5.0.13.tar.xz
+sha256 2e376076cf8a20c0f86fa30fc56a9ca35cadbe43908cd24b7d678f97f3676c61  linux-5.0.14.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 6fd8cd4d8a15d7bfb4a7968fbe104f97f8c5ff557c752aae43fe13a6ca073fb0  linux-4.19.40.tar.xz
-sha256 a05afa95163eab4ec76dabb51f54aea8c40ef63d5ea2d112ac04e6b79a8e8dbd  linux-4.14.116.tar.xz
-sha256 bc579d904f7d7d04adf03ed66dc8ac0a29d6cc74d989d3aa5c6ae2dedaf51168  linux-4.9.173.tar.xz
+sha256 90de6296504c64cbc4147fe053a1e8f88a98b7aed7896777e33a0321d0714782  linux-4.19.41.tar.xz
+sha256 a855a134e7a77dff92ad50f20501dbb39a1ee011ffa781ed885a3d17c6b9f23f  linux-4.14.117.tar.xz
+sha256 fc84fd68077fff55bb1779fbf3ee916257a4362a8e6d982773856c78f7865858  linux-4.9.174.tar.xz
 sha256 2c6a9d2765ef182f2470afed5af74de6c435ba9aaf422af54db8c5dc2b4f27d1  linux-4.4.179.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2042702eb9..3fd8b000c5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -298,10 +298,10 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.179"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.173"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.116"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.40"	if BR2_KERNEL_HEADERS_4_19
-	default "5.0.13"	if BR2_KERNEL_HEADERS_5_0
+	default "4.9.174"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.117"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.41"	if BR2_KERNEL_HEADERS_4_19
+	default "5.0.14"	if BR2_KERNEL_HEADERS_5_0
 	default "5.1"		if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.11.0
