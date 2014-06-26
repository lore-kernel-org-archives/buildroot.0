From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:18 -0300
Subject: [Buildroot] [PATCH 50/53] udpcast: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-50-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/udpcast/udpcast.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 786a88e..0cd3b27 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -7,6 +7,8 @@
 UDPCAST_VERSION = 20120424
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
+UDPCAST_LICENSE = BSD-2c, GPLv2
+UDPCAST_LICENSE_FILES = COPYING
 
 define UDPCAST_REMOVE_UDP_SENDER
 	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
-- 
1.8.5.5
