From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 17:03:21 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4,9,10}.x series
Message-ID: <20170427150359.07C7C8264C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=431bd936a154c16cab8dcf18563641949eed1cb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b574e65..846c825 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -218,7 +218,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.10.105"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.73"	if BR2_KERNEL_HEADERS_3_12
 	default "4.1.39"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.63"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.24"	if BR2_KERNEL_HEADERS_4_9
-	default "4.10.12"	if BR2_KERNEL_HEADERS_4_10
+	default "4.4.64"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.25"	if BR2_KERNEL_HEADERS_4_9
+	default "4.10.13"	if BR2_KERNEL_HEADERS_4_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
