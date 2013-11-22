From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 11:53:57 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3. {4, 10, 11,
	12}.x stable versions
Message-ID: <20131122145920.B11139B7A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13b32ef3346b815f3860d130e35563e7aa4a2af3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 997dce4..7ed476b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -83,14 +83,14 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.52"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.69"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.70"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.19"	if BR2_KERNEL_HEADERS_3_10
-	default "3.11.8"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12"		if BR2_KERNEL_HEADERS_3_12
+	default "3.10.20"	if BR2_KERNEL_HEADERS_3_10
+	default "3.11.9"	if BR2_KERNEL_HEADERS_3_11
+	default "3.12.1"	if BR2_KERNEL_HEADERS_3_12
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
