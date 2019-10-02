From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 18:00:20 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] {linux,
 linux-headers}: bump 4.19.x / 5.{2, 3}.x series
Message-ID: <20191002155651.B4CA388065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51072f3f06de302542fc9bfdc5329436d3709971
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 04e9fdb1c692597c6747bbe4d46eda0db5d60607)
[Peter: drop 5.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 77a483eacf..1562e24c34 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 dd5e7147e1e4501560fba5beb86dae6bf6ba843518ab3d4cad283de77b651b78  linux-4.19.75.tar.xz
+sha256 ba4dd29902734b263a5197410363b17f30dc60bc999bd6ce90b6f5910b971e66  linux-4.19.76.tar.xz
 sha256 a3c54b887ea3e679382bd4c0536e6a281b071dab2258bd3ee8af75baef2023f5  linux-4.14.146.tar.xz
 sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
 sha256 d5f4bb7584e461f1faa9a3f94c2ad292246fe692b0e992e072dac255f806c2e3  linux-4.9.194.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c907e5bf05..444626a57b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -300,7 +300,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.194"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.194"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.146"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.75"	if BR2_KERNEL_HEADERS_4_19
+	default "4.19.76"	if BR2_KERNEL_HEADERS_4_19
 	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
