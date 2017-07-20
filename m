From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 08:01:52 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] linux-headers: bump 3.{2,
	10, 18}.x series
Message-ID: <20170720055826.ACE8E82135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06eb06ad6deaa60ba87880e37435f2f7cfdcda72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2b82eb5..6b6b6ea 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -214,11 +214,11 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "3.2.89"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.91"	if BR2_KERNEL_HEADERS_3_2
 	default "3.4.113"	if BR2_KERNEL_HEADERS_3_4
-	default "3.10.106"	if BR2_KERNEL_HEADERS_3_10
+	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
 	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
-	default "3.18.59"	if BR2_KERNEL_HEADERS_3_18
+	default "3.18.61"	if BR2_KERNEL_HEADERS_3_18
 	default "3.19.8"	if BR2_KERNEL_HEADERS_3_19
 	default "4.0.9"		if BR2_KERNEL_HEADERS_4_0
 	default "4.1.42"	if BR2_KERNEL_HEADERS_4_1
