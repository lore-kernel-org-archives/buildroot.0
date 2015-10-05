From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 02:08:41 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.18.x series
Message-ID: <20151005001135.3C21A81DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d37bf8f15704e67eb1b3f009bd0b34b4765feae0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2e28f78..8a9682a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -198,7 +198,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.14.54"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
-	default "3.18.21"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.22"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.10"	if BR2_KERNEL_HEADERS_4_1
