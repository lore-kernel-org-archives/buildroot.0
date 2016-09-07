From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Sep 2016 11:59:53 +0200
Subject: [Buildroot] [git commit] linux-headers: bump 4.7.x series to 4.7.3
Message-ID: <20160907100558.B78E8818BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e38f19a21d5675560224ac8632242964ae03825c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 939a20a..9d8f030 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -249,5 +249,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.4.19"	if BR2_KERNEL_HEADERS_4_4
 	default "4.5.7"		if BR2_KERNEL_HEADERS_4_5
 	default "4.6.7"		if BR2_KERNEL_HEADERS_4_6
-	default "4.7.2"		if BR2_KERNEL_HEADERS_4_7
+	default "4.7.3"		if BR2_KERNEL_HEADERS_4_7
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
