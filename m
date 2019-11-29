From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 16:16:47 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.3.x series
Message-ID: <20191129153902.9978E82A18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4cadd11551df59580489291087c1336a418805b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2e5d631f8f170ccd67338ae99d0a23ed74a4d3ca)
[Peter: drop 5.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 78e0cefb1b..a469d5549c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 9a8ee3ff75dabffa76141c8dc7529dfbb3ca07888a3708a13f15b412268b3538  linux-5.2.21.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 868b4a92619cb00ab142a20a67f000525b9605820d1b66faa4a183133eac0660  linux-4.19.84.tar.xz
-sha256 86de4a24379a78d67fc08b2e249ccf7b689eb6c37fbe329fc3dfbe8ab4300603  linux-4.14.154.tar.xz
-sha256 383fd43bd35251636232912ad52fbc844e3c8ab792cadb62b4aefe000bacbd88  linux-4.9.201.tar.xz
-sha256 a78a85c4fb0c0835b01933765c984ab5ab190eac1d521338fb88b03a49641388  linux-4.4.201.tar.xz
+sha256 fdacceeae22d1a0467cae50c15e6e754bfb8bb8e8010623df0d8fd78f4adb929  linux-4.4.202.tar.xz
+sha256 8108ec1cd10fc40821c84e9f087dba10b1767aad66596f4a36925faef55e4ebf  linux-4.9.202.tar.xz
+sha256 77d61979556b81c95b81452fa10e1fe9368cbe2f9f80a13e4669b0464722e481  linux-4.14.155.tar.xz
+sha256 7bf435970aeeafd46263f49730087a61c4858d8b8fc5a4002ceac971b45f4fb7  linux-4.19.85.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bf4e921776..9a8db3e239 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.201"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.201"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.154"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.84"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.202"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.202"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.155"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.85"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default "5.2.21"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
