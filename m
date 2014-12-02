From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 13:01:19 +0100
Subject: [Buildroot] [git commit] linux-headers: bump 3.4.x series
Message-ID: <20141202120522.D807880075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56f6c3a701936ab766eba5aa1dc50280d5b912b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7e48309..516cd03 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -165,7 +165,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.64"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.104"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.105"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.61"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.33"	if BR2_KERNEL_HEADERS_3_12
