From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Dec 2017 22:54:21 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9}.x series
Message-ID: <20171216215439.A277083231@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06bbe7f7b8d1f1eac7e1663ce3d21373afb051ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index eec9635..522c2c4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -252,8 +252,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.47"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.105"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.69"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.106"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.70"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
