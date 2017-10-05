From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 5 Oct 2017 20:22:14 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 9, 13}.x series
Message-ID: <20171005181840.2834181046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55a6159dcd86da23f6ca36318e3ec8d17bdb7460
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ff9c0d2..9e1a77f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,10 +244,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.89"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.52"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.90"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.53"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
-	default "4.13.4"	if BR2_KERNEL_HEADERS_4_13
+	default "4.13.5"	if BR2_KERNEL_HEADERS_4_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
