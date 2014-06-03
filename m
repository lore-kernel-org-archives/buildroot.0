From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Jun 2014 22:14:25 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20140603201501.EDDC49CAC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50ec76a594e7d6a4b30508347700fbd0d9e48baf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dc71332..f6f7795 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -151,7 +151,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.41"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.20"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.21"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.5"	if BR2_KERNEL_HEADERS_3_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
