From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 11:09:41 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 3.{2,
 10}.x and 4.{1, 4, 9, 13}.x series
Message-ID: <20171127101629.A721C812FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf28669487dc889016456b7d217036350b6aa6f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.13.x bump]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 1b7b0053131d42e7f502920eae4283f1f4f6c430)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5b10d9b..ac6de27 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -214,15 +214,15 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.94"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.95"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "3.18.72"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.45"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.100"	if BR2_KERNEL_HEADERS_4_4
+	default "4.1.46"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.102"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.64"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.65"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
