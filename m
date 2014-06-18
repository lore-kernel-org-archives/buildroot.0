From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:04:14 +0200
Subject: [Buildroot] [git commit] openocd: switch homepage now that berlios
	is gone
Message-ID: <20140618123420.17CC69D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee7057c1c747cb13863ee669cfeb2de997fb0d8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openocd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index fc13977..7f96ef8 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENOCD
 	help
 	  OpenOCD - Open On-Chip Debugger
 
-	  http://openocd.berlios.de/web/
+	  http://openocd.sourceforge.net/
 
 if BR2_PACKAGE_OPENOCD
 
