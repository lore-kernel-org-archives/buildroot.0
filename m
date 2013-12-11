From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:47 -0300
Subject: [Buildroot] [PATCH 14/16] dhcpdump: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpdump/dhcpdump.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 1f1737d..cb2daa9 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -5,9 +5,10 @@
 ################################################################################
 
 DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE    = http://www.mavetju.org/download/
-
+DHCPDUMP_SITE  = http://www.mavetju.org/download/
 DHCPDUMP_DEPENDENCIES = libpcap
+DHCPDUMP_LICENSE = BSD-2c
+DHCPDUMP_LICENSE_FILES = LICENSE
 
 define DHCPDUMP_BUILD_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
-- 
1.8.3.2
