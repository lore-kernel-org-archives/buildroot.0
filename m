From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:35:17 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.2.x series
Message-ID: <20190930133047.AA7B38364F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b9a2f87c2361748035ccf56cbc5b90be8fd6b21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 893b9b662cb26eb4b972b339780db46e3e2c29f8)
[Peter: drop 5.2.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 77b195afd7..e639d0390f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 f9fcb6b3bd29115ac55fc154e300c3dce2044502732f6842ad6c25e6f9f51f6d  linux-4.19.72.tar.xz
-sha256 2534f2f03cb937700a03dd85dcf1cb6e6f46fdd29d489580cc3183d6c0643d93  linux-4.14.143.tar.xz
-sha256 7a1a300cce70a4fd0d49b7fff7b1673159b61c4040c5a7c08ea333a7cb328d54  linux-4.9.192.tar.xz
-sha256 2fba918dd21e421b4e0fd57dac052ba65f9947320892d960f093419561988a3b  linux-4.4.192.tar.xz
+sha256 495c2fead329c2c6b17950faa07ad7406e5aa93560e5e58de93a71197579ee82  linux-4.19.74.tar.xz
+sha256 eb05b5806713263a6d5bfa1e018ad07c3f4b3c6e71032306a94d7113ed594929  linux-4.14.145.tar.xz
+sha256 9be5081cc0fa6b720e6b3e5cb90296f3d857469bb3cda09ff93db00f9e16fd01  linux-4.9.193.tar.xz
+sha256 6afcde68645dbb9ce2fced3672186d80e96eb8c3e1ea7a66b64f619c7d073e8e  linux-4.4.193.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e7a8e1a9c1..8fdd45910e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -297,10 +297,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.192"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.192"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.143"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.72"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.193"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.193"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.145"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.74"	if BR2_KERNEL_HEADERS_4_19
 	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
