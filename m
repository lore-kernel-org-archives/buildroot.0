From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:06:23 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] {linux,
 linux-headers}: bump 4.{14, 19}.x series
Message-ID: <20191205210734.0BB54880A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b303cc63de59dee973c455b8e433421287190f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit af712ca7ce9a36f68c64cd9306005dbc86bc1502)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 517a11cbfe..d4467b9171 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -4,5 +4,5 @@ sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 fa1f8fe9c12e18e5cda18cf759b77ae9e778e1e9006d837426c955b75bd4eaa6  linux-4.4.205.tar.xz
 sha256 98b9e8644706acc0cf51022372bb263b59a1d2bbe3ccd7ce6bd9bc7378c78b05  linux-4.9.205.tar.xz
-sha256 f8889feb0cbd7df36ff35bd4c72c1e2010567621bfcb218fcfa501bc5c7787c0  linux-4.14.156.tar.xz
-sha256 bf2cbba319d43d1bd9e876ac0b55ab83118d1a1e61cce3c929d5371f7567bff6  linux-4.19.86.tar.xz
+sha256 90fa769a052ecf34a0cab72cf013e19275dbb8cd01bbe52f1d465e2ed7537733  linux-4.14.157.tar.xz
+sha256 a57221e8318e6fcaedb90b099d56352f9d6608fd367283bc7db84330856eda1d  linux-4.19.87.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5e279d4b19..be7ad580e0 100644
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
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default "5.2.21"	if BR2_KERNEL_HEADERS_5_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
