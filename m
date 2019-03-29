From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 14:51:26 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19, 20}.x / 5.0.x series
Message-ID: <20190329134812.B013F817E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85961d741e3327e65f615b4936b02bb8e725dc84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Notice: 4.20.x is now EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop 4.19.x/4.20.x/5.0.x, linux / hash changes]
(cherry picked from commit 198b4cff10aa7e25bac28b54721638119e8fd1f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7ad634899c..52ab36080c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,12 +250,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.176"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.160"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.177"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.166"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.103"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.109"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
