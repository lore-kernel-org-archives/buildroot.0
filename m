From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Dec 2019 10:54:23 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x series
Message-ID: <20191201095423.29775-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index f8ef927c97..ba42b8357a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -3,5 +3,5 @@ sha256 955712688c7256675383ec5be4ee044dbb59116a9a1f24e8689d12a6f95f7932  linux-5
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 fa1f8fe9c12e18e5cda18cf759b77ae9e778e1e9006d837426c955b75bd4eaa6  linux-4.4.205.tar.xz
 sha256 98b9e8644706acc0cf51022372bb263b59a1d2bbe3ccd7ce6bd9bc7378c78b05  linux-4.9.205.tar.xz
-sha256 f8889feb0cbd7df36ff35bd4c72c1e2010567621bfcb218fcfa501bc5c7787c0  linux-4.14.156.tar.xz
-sha256 bf2cbba319d43d1bd9e876ac0b55ab83118d1a1e61cce3c929d5371f7567bff6  linux-4.19.86.tar.xz
+sha256 90fa769a052ecf34a0cab72cf013e19275dbb8cd01bbe52f1d465e2ed7537733  linux-4.14.157.tar.xz
+sha256 a57221e8318e6fcaedb90b099d56352f9d6608fd367283bc7db84330856eda1d  linux-4.19.87.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a170cfa4fd..95748ea62c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -307,8 +307,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.205"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.205"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.156"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.86"	if BR2_KERNEL_HEADERS_4_19
+	default "4.14.157"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.87"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.14"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.20.1
