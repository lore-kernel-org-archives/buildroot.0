From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 09:42:25 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.10.x series
Message-ID: <20160615074639.6E54181FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c9f149a21625810e58e02423a6960dea4571571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index eed8d6a..bafe575 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -220,7 +220,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.2.80"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.112"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.101"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.102"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.60"	if BR2_KERNEL_HEADERS_3_12
 	default "3.14.72"	if BR2_KERNEL_HEADERS_3_14
 	default "3.18.35"	if BR2_KERNEL_HEADERS_3_18
