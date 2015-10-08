From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Oct 2015 17:07:40 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20151008151450.E97A17FA69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b47d9d4ff056f589fbf6011c181d831a1c3a681
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8a9682a..adcf616 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -194,7 +194,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.71"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.109"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.90"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.48"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.49"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.54"	if BR2_KERNEL_HEADERS_3_14
 	default "3.16.7"	if BR2_KERNEL_HEADERS_3_16
 	default "3.17.8"	if BR2_KERNEL_HEADERS_3_17
