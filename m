From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:41:21 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 4.{4,
 9}.x series
Message-ID: <20171227095308.B690F82BDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83c800a50a9e052202000ce6d0d34413ba87224c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e394b446f5c61da23f9b33a132f244648149a3c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index cff856e..f44d4df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -244,8 +244,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.46"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.102"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.65"	if BR2_KERNEL_HEADERS_4_9
+	default "4.4.103"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.66"	if BR2_KERNEL_HEADERS_4_9
 	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
 	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
 	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
