From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 22:30:12 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.12.x series
Message-ID: <20140625203128.BD8DB9D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=260b1e0a9cf3e811e9bbee8998314484cce7ee37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0a4e00c..1665aad 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -153,7 +153,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
 	default "3.10.44"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
-	default "3.12.22"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.23"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
 	default "3.14.8"	if BR2_KERNEL_HEADERS_3_14
 	default "3.15.1"	if BR2_KERNEL_HEADERS_3_15
