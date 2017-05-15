From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:53:50 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/linux-headers:
	bump 3.12.x and 4.{4, 9, 10}.x series
Message-ID: <20170515125327.61FF882901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c12eab4e75ec7c9f6c1c279e0e3b1ffbf9c701b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.10.x bump]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d48436c2bf7ca5a6e3d38ce5c2f3ba0ddd6d7386)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 205806a..0fd5f68 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -217,12 +217,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.88"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "3.18.51"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.66"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.67"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.26"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.27"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
