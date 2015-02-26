From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 00:19:51 +0100
Subject: [Buildroot] [git commit branch/next] linux-headers: bump 3.{2,
	12}.x series
Message-ID: <20150226232030.D56217F9FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b527e3b449006aa3660a76020f6d67c87c2a6849
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1e206ce..e50f60c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -189,11 +189,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.66"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.67"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.106"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.68"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.37"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.38"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.32"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.10"	if BR2_KERNEL_HEADERS_3_15
