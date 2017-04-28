From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:21:09 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
	9, 10}.x series
Message-ID: <20170428125447.D219A827E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b671fa3b63d80ca0226ad297af64e77064aaeec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.10.x bump]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 37159734b01b2246272f1d419110b750df40cad5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7e246b9..747f24d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.62"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.63"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.23"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.24"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
