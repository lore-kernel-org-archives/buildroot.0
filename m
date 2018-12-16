From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:43:51 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x series
Message-ID: <20181216143957.5EA528B433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faa7f879368f4b6d4f45bb28deceb4fcd591a84a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 177a8a5fd966c09c237dc93cc8e131dbb5dfadd2)
[Peter: drop 4.19.x, linux / hash changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 56a3f52f55..b2a27bf7fe 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -251,11 +251,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.166"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.142"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.143"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.85"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.86"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
