From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 20:12:36 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.{4, 10, 14,
	15}.x series
Message-ID: <20140718185453.054069D27D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba5134e7ceb8d6ea69b89af9ac66d412b5ad2abb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3a78596..9cacf7b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -149,12 +149,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.61"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.98"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.99"	if BR2_KERNEL_HEADERS_3_4
 	default "3.9.11"	if BR2_KERNEL_HEADERS_3_9
-	default "3.10.48"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.49"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.24"	if BR2_KERNEL_HEADERS_3_12
 	default "3.13.11"	if BR2_KERNEL_HEADERS_3_13
-	default "3.14.12"	if BR2_KERNEL_HEADERS_3_14
-	default "3.15.5"	if BR2_KERNEL_HEADERS_3_15
+	default "3.14.13"	if BR2_KERNEL_HEADERS_3_14
+	default "3.15.6"	if BR2_KERNEL_HEADERS_3_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
