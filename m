From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:14:52 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.1.x
	series
Message-ID: <20170905220138.6DCA47FA06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1b0e69d92f137e1b2d7778b1a335005674d655b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d38797edee9b3e09492616a33c79c23a46d5a7ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4cf4667..cf2dc07 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -221,7 +221,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.61"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
+	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
 	default "4.4.79"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
 	default "4.9.40"	if BR2_KERNEL_HEADERS_4_9
