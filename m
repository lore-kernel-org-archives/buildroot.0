From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 08:57:20 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 3.{2,
	12}.x and 4.{1, 4, 9, 10}.x series
Message-ID: <20170331071606.AF12A826C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bc876f43b1954e0494b5f360c8e0f9ddc5624e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.10.x update]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0d70d1dbf054f4a0609ba1076bc7e097305013d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 81ddc9d..de55b04 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -214,15 +214,15 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.85"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.87"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.71"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.72"	if BR2_KERNEL_HEADERS_3_12
 	default "3.18.48"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.55"	if BR2_KERNEL_HEADERS_4_4
+	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.56"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.16"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.17"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
