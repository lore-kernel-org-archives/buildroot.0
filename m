From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 08:37:44 +0200
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.2.x series
Message-ID: <20190929063744.31594-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b6442c42f2..16aa4db4cd 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 9890b5a909d316211d045a95f5f0680e39749f2319cb26d7cd067efaa692f858  linux-5.3.1.tar.xz
-sha256 0c2061c9edc8ab213b77f23af1d5a018127c2603404498a528651d56a795e575  linux-5.2.16.tar.xz
+sha256 7b3b8ad09ea936b4216dd02c5fc2ef39c8f58935d0a81ab9690f0fc451102df9  linux-5.2.17.tar.xz
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 495c2fead329c2c6b17950faa07ad7406e5aa93560e5e58de93a71197579ee82  linux-4.19.74.tar.xz
-sha256 eb05b5806713263a6d5bfa1e018ad07c3f4b3c6e71032306a94d7113ed594929  linux-4.14.145.tar.xz
-sha256 9be5081cc0fa6b720e6b3e5cb90296f3d857469bb3cda09ff93db00f9e16fd01  linux-4.9.193.tar.xz
-sha256 6afcde68645dbb9ce2fced3672186d80e96eb8c3e1ea7a66b64f619c7d073e8e  linux-4.4.193.tar.xz
+sha256 dd5e7147e1e4501560fba5beb86dae6bf6ba843518ab3d4cad283de77b651b78  linux-4.19.75.tar.xz
+sha256 a3c54b887ea3e679382bd4c0536e6a281b071dab2258bd3ee8af75baef2023f5  linux-4.14.146.tar.xz
+sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
+sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b67a48cf3d..39cb849b7f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -313,12 +313,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.193"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.193"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.145"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.74"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.194"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.194"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.146"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.75"	if BR2_KERNEL_HEADERS_4_19
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
-	default "5.2.16"	if BR2_KERNEL_HEADERS_5_2
+	default "5.2.17"	if BR2_KERNEL_HEADERS_5_2
 	default "5.3.1"		if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.20.1
