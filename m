From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Sep 2014 17:50:41 -0300
Subject: [Buildroot] [PATCH 6/7] tcpdump: bump to version 4.6.2
In-Reply-To: <1409863842-24226-1-git-send-email-gustavo@zacarias.com.ar>
References: <1409863842-24226-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1409863842-24226-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tcpdump/tcpdump.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index ade0136..bcbaec9 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.6.1
+TCPDUMP_VERSION = 4.6.2
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
1.8.5.5
