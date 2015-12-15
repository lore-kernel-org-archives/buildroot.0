From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:40:54 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 4.{1, 2, 3}.x series
Message-ID: <20151215204244.2CD4081DBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4d7580c0f04f656f5ff7b7b7a897562eeec68cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f1ca16b..c02c940 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -209,7 +209,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.18.24"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
-	default "4.1.14"	if BR2_KERNEL_HEADERS_4_1
-	default "4.2.7"		if BR2_KERNEL_HEADERS_4_2
-	default "4.3.2"		if BR2_KERNEL_HEADERS_4_3
+	default "4.1.15"	if BR2_KERNEL_HEADERS_4_1
+	default "4.2.8"		if BR2_KERNEL_HEADERS_4_2
+	default "4.3.3"		if BR2_KERNEL_HEADERS_4_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
