From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 21:02:22 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.2.x series
Message-ID: <20190925185931.D1CE88F4AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27173aa902098de5e533d19c3fc280d1a452fa42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dc82013bf59bbf1280f525b3296d6cd597ad4f2a)
[Peter: drop 5.2.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 7985320e9f..77b195afd7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,7 +2,7 @@
 sha256 56495f82314f0dfb84a3fe7fad78e17be69c4fd36ef46f2452458b2fa1e341f6  linux-5.1.21.tar.xz
 sha256 98d307a546c95a215dee675ffa4b63c2a7a29e7af839f0d8dfb96dbb61aac2d7  linux-5.0.21.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 c091760b520a4e4a4c7034a8329cc2689a0ea3f81a377b694ed196d623e2d987  linux-4.19.69.tar.xz
-sha256 0bb9f0812326ec4554de1bea02628840e03b6664b5abfd9d8510049e43203a17  linux-4.14.141.tar.xz
-sha256 fe8a1ca080a462de6832762ba8b71410b828f0e52c1e11d3c46d83e9ac1e0a16  linux-4.9.190.tar.xz
-sha256 fec8c8549a3775b922cecad74a6409b33520a669d451dc51ad47d69c2543c2e5  linux-4.4.190.tar.xz
+sha256 f9fcb6b3bd29115ac55fc154e300c3dce2044502732f6842ad6c25e6f9f51f6d  linux-4.19.72.tar.xz
+sha256 2534f2f03cb937700a03dd85dcf1cb6e6f46fdd29d489580cc3183d6c0643d93  linux-4.14.143.tar.xz
+sha256 7a1a300cce70a4fd0d49b7fff7b1673159b61c4040c5a7c08ea333a7cb328d54  linux-4.9.192.tar.xz
+sha256 2fba918dd21e421b4e0fd57dac052ba65f9947320892d960f093419561988a3b  linux-4.4.192.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ff5c9e6340..e7a8e1a9c1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -297,10 +297,10 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.190"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.190"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.141"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.69"	if BR2_KERNEL_HEADERS_4_19
+	default "4.4.192"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.192"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.143"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.72"	if BR2_KERNEL_HEADERS_4_19
 	default "5.0.21"	if BR2_KERNEL_HEADERS_5_0
 	default "5.1.21"	if BR2_KERNEL_HEADERS_5_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
