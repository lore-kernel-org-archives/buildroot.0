From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:15:53 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
	9, 12}.x series
Message-ID: <20170905220138.7785981ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99c6d668a6c6e893fb12be04099d727b4c482189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: drop 4.12.x bump]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a4a6c74171d2411fa95d92ce489582b3f10ba705)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cf2dc07..4a3afd4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -222,7 +222,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.79"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.80"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.40"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.41"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
