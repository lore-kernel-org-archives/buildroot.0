From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Dec 2013 23:51:44 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3. {4, 10,
	12}.x stable versions
Message-ID: <20131212230221.649E69BFEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b11fd4099475066a5b6ece4a0aeb68f32946f54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d928897..2b040cd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -83,14 +83,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.53"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.73"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.74"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.23"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.24"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.4"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.5"	if BR2_KERNEL_HEADERS_3_12
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
