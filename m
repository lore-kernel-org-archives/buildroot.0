From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Jun 2015 15:59:03 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.4.x series
Message-ID: <20150620135939.11F91807A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9eda4b423c261db151b7c462cded7baa99e2df92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 28b8929..9bad7f0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -200,7 +200,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.69"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.107"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.108"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.80"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.44"	if BR2_KERNEL_HEADERS_3_12
