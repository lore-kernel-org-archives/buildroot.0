From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:17:58 +0100
Subject: [Buildroot] [PATCH 08/33] owl-linux: update help text about linux
	kernel dependencies.
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/owl-linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.0
