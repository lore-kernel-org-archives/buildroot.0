From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  5 Feb 2013 16:29:50 -0300
Subject: [Buildroot] [PATCH 1/2] squid: bump to version 3.2.7
Message-ID: <1360092591-14958-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 95c212a..7cae0be 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.2.6
+SQUID_VERSION = 3.2.7
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.2
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
-- 
1.7.12.4
