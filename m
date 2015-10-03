From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 3 Oct 2015 22:08:05 +0100
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{1,2}.x series
Message-ID: <1443906486-11119-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/linux-headers/Config.in.host |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 101f30d..2e28f78 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -201,6 +201,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.21"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.9"		if BR2_KERNEL_HEADERS_4_1
-	default "4.2.2"		if BR2_KERNEL_HEADERS_4_2
+	default "4.1.10"	if BR2_KERNEL_HEADERS_4_1
+	default "4.2.3"		if BR2_KERNEL_HEADERS_4_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.1
