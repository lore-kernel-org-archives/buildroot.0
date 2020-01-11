From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 11:47:11 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.4.x series
Message-ID: <20200111103733.807F888FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e2e3411a5e504f0b97cbb736cfa186343f668f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3cb8d6c3a67929127f470aead6eac28ec1590678)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index e7d8d3a784..c084245ba2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -3,5 +3,5 @@ sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 5899ff2a85e2b84607148349fd8e646f94399655caf0e4e55d1eb0567e48520e  linux-4.4.208.tar.xz
 sha256 b7ad1c9841d671d026c55a4c91c77205f8b488ca5f980f838591c68662e0525a  linux-4.9.208.tar.xz
-sha256 f65170224cd4359ce8b2793b492bd8127abdd0b91350484e001bce13f0c98b4b  linux-4.14.162.tar.xz
-sha256 2af5d23f82a8bf69a6e4d8407579293b7beeebd3054dc464d48bdb5d2d7f5834  linux-4.19.93.tar.xz
+sha256 eb29cc9cfd54158789064b3d6e5b3eab108facec048b8d405a63e9863329b049  linux-4.14.163.tar.xz
+sha256 c62a10a75a7c4213e41287040e7c7509b7d42117d6830feb7dfe505949fa7467  linux-4.19.94.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e26cbe6f77..6fa553beb0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -307,8 +307,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.208"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.208"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.162"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.93"	if BR2_KERNEL_HEADERS_4_19
+	default "4.14.163"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.94"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
