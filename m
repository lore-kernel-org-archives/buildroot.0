From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  4 May 2014 08:42:25 -0300
Subject: [Buildroot] [PATCH 1/2] squid: bump to version 3.4.5
Message-ID: <1399203746-3477-1-git-send-email-gustavo@zacarias.com.ar>
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
index a236ab9..4d0f516 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).4
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).5
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
1.8.3.2
