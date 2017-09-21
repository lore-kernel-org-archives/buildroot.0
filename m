From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 14:16:01 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{9,
	12, 13}.x series
Message-ID: <20170921125626.4D87B80DB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0753098a5dacdfee6e0ce8635ced56ef8c4d08e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.12.x/4.13.x bump]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 2aae8765fd8ce95a8a1f902f96293b610c5b8405)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c83e3c5..6794542 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -224,5 +224,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.87"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.48"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.49"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
