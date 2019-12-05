From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 21:44:48 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{4, 9}.x / 5.3.x series
Message-ID: <20191205203720.1902B880A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe6814bce7312d359f383c6a5f1c89a9e775debf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop 5.3.x bump]
(cherry picked from commit b20487151af79563da763d0f053deb78ff63172a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 511646e577..ec2c2a18fa 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 47e3030d80b9a3b96cdefc008db57f9faa87e2d093437d941caec3ca9ed89924  linux-4.4.204.tar.xz
-sha256 47a1987cb34182e625cac95f497a534461ff881b3bcb485b37507a086857bf50  linux-4.9.204.tar.xz
+sha256 fa1f8fe9c12e18e5cda18cf759b77ae9e778e1e9006d837426c955b75bd4eaa6  linux-4.4.205.tar.xz
+sha256 98b9e8644706acc0cf51022372bb263b59a1d2bbe3ccd7ce6bd9bc7378c78b05  linux-4.9.205.tar.xz
 sha256 f8889feb0cbd7df36ff35bd4c72c1e2010567621bfcb218fcfa501bc5c7787c0  linux-4.14.156.tar.xz
 sha256 bf2cbba319d43d1bd9e876ac0b55ab83118d1a1e61cce3c929d5371f7567bff6  linux-4.19.86.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7c738ba9a1..66564021e8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -287,8 +287,8 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.204"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.204"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.205"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.205"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.156"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.86"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
