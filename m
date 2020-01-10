From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 20:47:07 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] {linux,
 linux-headers}: bump 4.19.x / 5.4.x series
Message-ID: <20200110193733.88BC08882E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c05cb227db14d1a67295473175f25a52de8c5bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 41ca1dc1ac62ad7edd9178a313d6744f9c63c694)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 57aff83e6c..e7d8d3a784 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -4,4 +4,4 @@ sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5
 sha256 5899ff2a85e2b84607148349fd8e646f94399655caf0e4e55d1eb0567e48520e  linux-4.4.208.tar.xz
 sha256 b7ad1c9841d671d026c55a4c91c77205f8b488ca5f980f838591c68662e0525a  linux-4.9.208.tar.xz
 sha256 f65170224cd4359ce8b2793b492bd8127abdd0b91350484e001bce13f0c98b4b  linux-4.14.162.tar.xz
-sha256 29c37cf8bbfa717ce98bc931371c35fcee3482734ad5faba32d02aff209883a2  linux-4.19.92.tar.xz
+sha256 2af5d23f82a8bf69a6e4d8407579293b7beeebd3054dc464d48bdb5d2d7f5834  linux-4.19.93.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9f08f91d44..e26cbe6f77 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -308,7 +308,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.208"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.208"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.162"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.92"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.93"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
