From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 09:03:09 +0100
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4,
 9}.x series
Message-ID: <20191129080338.11D7481E0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7db05db3d103f74b7cd584871eef541ac29e92d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3566c93266..bf0624e75d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256 9f04e53f03d0ead6561195fb71aac18cbee419112ed54f9d4fc1515a5fa5c92f  linux-5.3.13.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256 9262528aeaf5991c2008d7d9ea3994f9a548f000da39c0565a35f50863b4790a  linux-4.4.203.tar.xz
-sha256 1cd950cfaff8ddcc11596d970ec622fa3cdbedd75d3e28ddd3a9383f3cb2a849  linux-4.9.203.tar.xz
+sha256 47e3030d80b9a3b96cdefc008db57f9faa87e2d093437d941caec3ca9ed89924  linux-4.4.204.tar.xz
+sha256 47a1987cb34182e625cac95f497a534461ff881b3bcb485b37507a086857bf50  linux-4.9.204.tar.xz
 sha256 f8889feb0cbd7df36ff35bd4c72c1e2010567621bfcb218fcfa501bc5c7787c0  linux-4.14.156.tar.xz
 sha256 bf2cbba319d43d1bd9e876ac0b55ab83118d1a1e61cce3c929d5371f7567bff6  linux-4.19.86.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5f1952731c..37b0db1de9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -305,8 +305,8 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.203"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.203"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.204"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.204"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.156"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.86"	if BR2_KERNEL_HEADERS_4_19
 	default "5.3.13"	if BR2_KERNEL_HEADERS_5_3
