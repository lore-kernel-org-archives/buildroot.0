From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Mar 2015 13:30:25 -0300
Subject: [Buildroot] [PATCH] busybox: enable arp applet
Message-ID: <1426177825-410-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's pretty common, small and useful, specially since busybox ip doesn't
do neigh (and looking at /proc/net/arp is all fine but not very
friendly).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 20b8c1d..9d930d1 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -767,7 +767,7 @@ CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 # CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
-# CONFIG_ARP is not set
+CONFIG_ARP=y
 CONFIG_ARPING=y
 # CONFIG_BRCTL is not set
 # CONFIG_FEATURE_BRCTL_FANCY is not set
-- 
2.0.5
