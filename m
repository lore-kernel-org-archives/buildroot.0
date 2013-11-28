From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Nov 2013 09:57:17 -0300
Subject: [Buildroot] [PATCH 2/2] tcpdump: bump to version 4.5.1
In-Reply-To: <1385643437-8189-1-git-send-email-gustavo@zacarias.com.ar>
References: <1385643437-8189-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1385643437-8189-2-git-send-email-gustavo@zacarias.com.ar>
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
index a865e81..0f4cebb 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.4.0
+TCPDUMP_VERSION = 4.5.1
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
1.8.3.2
