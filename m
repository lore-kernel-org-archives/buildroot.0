From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 07:44:53 -0800
Subject: [Buildroot] [git commit] owl-linux: update help text about linux
	kernel dependencies.
Message-ID: <20121130154711.17E219950B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82583bf4b7765df6edad45aaec0aba0ddbd571a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/owl-linux/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/owl-linux/Config.in b/package/owl-linux/Config.in
index f6e18d5..1dcf5f1 100644
--- a/package/owl-linux/Config.in
+++ b/package/owl-linux/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_OWL_LINUX
 	help
 	  Linux kernel driver for the H&D Wireless SPB104 SD-card WiFi SIP.
 
+	  owl-linux requires the hidden kernel option WIRELESS_EXT enabled.
+
 	  http://linux.hd-wireless.se/bin/view/Linux/GettingStarted
 
 comment "owl-linux requires a Linux kernel"
