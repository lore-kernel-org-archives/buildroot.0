From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 11:29:20 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/linux-headers:
 bump 4.{4, 9, 14, 19}.x series
Message-ID: <20190124102844.3C3AA8E4AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82231c4176277f467340fa17b3d773f43c3ad0a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5bbc4724633d1d6e04385ccd41db0b77252bdcf8)
[Peter: drop 4.19.x, linux / hash changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b2a27bf7fe..cbd6a5b496 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -250,12 +250,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
 	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.166"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.143"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.169"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.148"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
 	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
-	default "4.14.86"	if BR2_KERNEL_HEADERS_4_14
+	default "4.14.91"	if BR2_KERNEL_HEADERS_4_14
 	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
