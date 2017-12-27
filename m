From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:59:54 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: security
 bump 4.{4, 9, 14}.x series
Message-ID: <20171227100047.BF89583558@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48a5756d6bead86b8e9e0dc24e6e0e7527b65812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Fixes CVE-2017-1000405.

[Peter: drop 4.14.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
[Thomas: adjust commit description to mention the CVE being fixed.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 9f5178fa3495b5b59c4d86c2d1a6fca23bf4e6f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f44d4df..fad5f06 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,8 +244,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.46"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.103"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.66"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.104"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.67"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
