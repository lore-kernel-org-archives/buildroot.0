From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:11:41 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] linux-headers: bump 4.{4,
 9, 13}.x series
Message-ID: <20171126213855.ED92A81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8cb606e0c15049bef8e147bb07cd42057458489
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

[Peter: drop 4.13.x bump]
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2aa12565d6645b5bf85b0da8f0b736f5482f1333)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3ad65d6..02a3d8a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -236,8 +236,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.96"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.60"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.97"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.61"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
