From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Apr 2020 18:10:09 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.4.x series
Message-ID: <20200406155905.B78B38C94C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41e62c2e40f02349dfc426c852eb4357d3005380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit caaee4fd66a111a3c58840a0d01b2812d70a2e90)
[Peter: drop 5.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b933577341..f5e7fe419f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5.3.18.tar.xz
-sha256  28bcd3d4201da9feefdf3bcd65c516dd674acbbf45681ce3c7d784c53b33fe03  linux-4.4.215.tar.xz
-sha256  236f2f47853700f22b9925cb17917d97ff7120fcc8110ec827c5a030a8129f48  linux-4.9.215.tar.xz
-sha256  2318a1ab937580a079351ed20557c336a3d95b664f667b14e3ba49e3271b217a  linux-4.14.172.tar.xz
-sha256  654bac198d38e03e7bff9e2642b01f498dc0fa5d06198edd14bc30fe7fbf0240  linux-4.19.107.tar.xz
+sha256  20f14917c4f33122cfa12963a7d3180fe6f4685cacfe984553b2b5b4ad20638c  linux-5.3.18.tar.xz
+sha256  fdeac4c05fcca993927fdce51446b4f81725f54e753fea02b0b2dacf3d64526f  linux-4.4.217.tar.xz
+sha256  6fb2a54602ebf750a39ba9750dc8d3bc34308518647f5bd2f562dee4d2566819  linux-4.9.217.tar.xz
+sha256  4c223ca3565d4267b403f7432860d87c8301767eb654d046d268782b18155189  linux-4.14.174.tar.xz
+sha256  24c2b11cc0ed57a90de776436efc21dd4345583b1a25d92ed49e71031fc73e7a  linux-4.19.112.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 92a1e69225..fb4d37654c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,10 +305,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.215"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.215"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.172"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.107"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.217"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.217"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.174"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.112"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.18"	if BR2_KERNEL_HEADERS_5_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
