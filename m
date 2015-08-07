From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Aug 2015 10:37:34 -0300
Subject: [Buildroot] [PATCH next 5/5] squid: bump to version 3.5.7
In-Reply-To: <1438954654-11777-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438954654-11777-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438954654-11777-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index d5738c7..472df2d 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.6.tar.xz.asc
-md5  93e18bd257857e35bb634ddb8a348563  squid-3.5.6.tar.xz
-sha1  c5f3ab47e61a08fa6a8767d45befeffd7d26fd9f  squid-3.5.6.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.7.tar.xz.asc
+md5	e24943386555ca922130a7e034badba7	squid-3.5.7.tar.xz
+sha1	e7dcc0cbcee6fd10a8c8bf3e9bff0dc6359ccc48	squid-3.5.7.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index e140773..e8fd079 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).6
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).7
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.4.6
