From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Oct 2017 00:41:33 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] linux-headers: bump 4.{4,
	9, 13}.x series
Message-ID: <20171022224415.4856080E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e04fc15a1dc1345824986ce333348db5aef7ca7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

[Peter: drop 4.13.x bump]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f7479f4c818f335332fdca128d7d4f3e5e7c02ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 32d4505..d531a88 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -236,8 +236,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.93"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.57"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.94"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.58"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
