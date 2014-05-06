From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 May 2014 22:53:55 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4,10,14}.x series
Message-ID: <20140506205500.12C569CAEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07ec054d85a9542a3d6bb5d7539e08c2031dca15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index df208bf..177f0c2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -146,12 +146,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.58"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.88"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.89"	if BR2_KERNEL_HEADERS_3_4
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.38"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.39"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.18"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.2"	if BR2_KERNEL_HEADERS_3_14
+	default "3.14.3"	if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
