From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Jan 2018 22:31:50 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux-headers: bump 3.2.x
 series
Message-ID: <20180108215441.975E5838FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9feb0845fcecf1ade90b084a8b62083b045e67e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 28d57106b87ef97480374925e5f44dc541eba381)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4d9652b..872614f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -239,7 +239,7 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.96"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.97"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.108"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
