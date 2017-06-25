From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:26:39 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux-headers: bump 4.{1,
	4, 9, 11}.x series
Message-ID: <20170625223515.98DC37FD8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13628443843f3294dc31861b4fbdc740e286ede0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 859764ac39c18c6aaabbb6a1a47f2fa2e5793044)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 70a90a9..6704305 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -226,9 +226,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "4.1.40"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.72"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.32"	if BR2_KERNEL_HEADERS_4_9
+	default "4.1.41"	if BR2_KERNEL_HEADERS_4_1
+	default "4.4.73"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.33"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
-	default "4.11.5"	if BR2_KERNEL_HEADERS_4_11
+	default "4.11.6"	if BR2_KERNEL_HEADERS_4_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
