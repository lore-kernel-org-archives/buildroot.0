From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 Oct 2014 18:47:55 -0300
Subject: [Buildroot] [PATCH 2/2] squid: bump to version 3.4.9
In-Reply-To: <1414792075-31124-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414792075-31124-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414792075-31124-2-git-send-email-gustavo@zacarias.com.ar>
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
index 295a0fd..8bc8dbd 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.8.tar.xz.asc
-md5	b0c4335447248810169f58ea4d8b204a	squid-3.4.8.tar.xz
-sha1	e2e20414252f315b2912ae32ac084ea07a48133f	squid-3.4.8.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.9.tar.xz.asc
+md5	497e5be7b3430d12667628296760beca	squid-3.4.9.tar.xz
+sha1	7d652e2f3794e15302d36700a167f16d24ad6cd5	squid-3.4.9.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 041df17..e8a2ccc 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).8
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).9
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.0.4
