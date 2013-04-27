From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Apr 2013 12:15:27 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.3.4
Message-ID: <1367075727-1948-1-git-send-email-gustavo@zacarias.com.ar>
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
index 5832aa7..45a0b2c 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.3.3
+SQUID_VERSION = 3.3.4
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
-- 
1.8.1.5
