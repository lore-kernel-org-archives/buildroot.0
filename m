From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 11:37:36 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.2.x series
Message-ID: <20191001093457.026808437C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8218552e5ba144b3fa640d3586102c810420330d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 80d32c942a79b2f3c557176fd3c522b669dd3a61)
[Peter: drop 5.2.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index e639d0390f..77a483eacf 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
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
index 8fdd45910e..c907e5bf05 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -297,10 +297,10 @@ endchoice
 
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
 	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
