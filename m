From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jun 2014 09:31:21 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.2.x series
Message-ID: <20140610074329.A3B759CFB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bab6990c9002694809d872ecdf3901bdeed142e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8b55954..82778cc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -153,7 +153,7 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
-	default "3.2.59"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.60"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.92"	if BR2_KERNEL_HEADERS_3_4
 	default "3.8.13"	if BR2_KERNEL_HEADERS_3_8
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
