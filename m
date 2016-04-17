From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 16:17:02 +0200
Subject: [Buildroot] [git commit] gstreamer1: fix help text typos
Message-ID: <20160417141708.50DAA81840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c656c3a69692a57e8742432dc178a0a2d88f8135
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gstreamer1/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index c13f041..274171b 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_GSTREAMER1_PARSE
 	bool "enable command-line parser"
 	default y
 	help
-	  Enable command line parser for gstreamer. This may incrase the CPu
+	  Enable command line parser for gstreamer. This may increase the CPU
 	  overhead by a small amount.
 
 config BR2_PACKAGE_GSTREAMER1_TRACE
