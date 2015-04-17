From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Apr 2015 18:31:37 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 3.4.x series
Message-ID: <20150417163146.7D0F88189D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da9eff07fda36a1f4703a6232051da86c2d91d1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-headers/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index de14fd5..49f818b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -199,7 +199,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "3.0.101"	if BR2_KERNEL_HEADERS_3_0
 	default "3.2.68"	if BR2_KERNEL_HEADERS_3_2
-	default "3.4.106"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.107"	if BR2_KERNEL_HEADERS_3_4
 	default "3.10.74"	if BR2_KERNEL_HEADERS_3_10
 	default "3.11.10"	if BR2_KERNEL_HEADERS_3_11
 	default "3.12.40"	if BR2_KERNEL_HEADERS_3_12
