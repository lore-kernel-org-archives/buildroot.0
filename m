From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 14:58:32 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{4, 8}.x series
Message-ID: <20161101140028.05F2B817FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaf9b5044a75ceca83f092c001dec2dc59d221b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e770a44..71d3f60 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -232,9 +232,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.35"	if BR2_KERNEL_HEADERS_4_1
-	default "4.4.28"	if BR2_KERNEL_HEADERS_4_4
+	default "4.4.29"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
 	default "4.7.10"	if BR2_KERNEL_HEADERS_4_7
-	default "4.8.5"		if BR2_KERNEL_HEADERS_4_8
+	default "4.8.6"		if BR2_KERNEL_HEADERS_4_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
