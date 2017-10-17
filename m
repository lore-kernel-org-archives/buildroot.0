From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 10:54:40 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] linux-headers: bump 3.2.x
	and 4.{4, 9, 13}.x series
Message-ID: <20171017090327.31222811B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4fb43121bbe0b46d71f042a9e2d30a3bbbe1979
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

[Peter: drop 4.13.x bump]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 2cd4c845865ca86ee3d7b015670063b347cb49f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c440a64..7001bd2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -231,13 +231,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.93"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.94"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.90"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.53"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.92"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.56"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
