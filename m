From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:00:51 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4,9,10}.x series
Message-ID: <20170426072113.0A430801E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37159734b01b2246272f1d419110b750df40cad5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7a62442..b574e65 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,7 +218,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.62"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.23"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.11"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.63"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.24"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.12"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
