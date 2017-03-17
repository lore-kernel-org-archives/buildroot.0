From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:16:36 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 4.{4,
	9, 10}.x and 3.12.x series
Message-ID: <20170317234445.0D1FB825C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb398d3a4d806399e52c1f970a415cd718133403
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

[Peter: skip 4.10.x]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d18cdcebc238706d1bf50460b85ea36eaed83b21)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ee02a45..72fbcc6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -217,12 +217,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.2.85"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
-	default "3.12.70"	if BR2_KERNEL_HEADERS_3_12
+	default "3.12.71"	if BR2_KERNEL_HEADERS_3_12
 	default "3.18.48"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.38"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.52"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.53"	if BR2_KERNEL_HEADERS_4_4
 	default "4.8.17"	if BR2_KERNEL_HEADERS_4_8
-	default "4.9.13"	if BR2_KERNEL_HEADERS_4_9
+	default "4.9.14"	if BR2_KERNEL_HEADERS_4_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
