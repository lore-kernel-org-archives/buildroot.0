From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 10:41:40 -0300
Subject: [Buildroot] [PATCH] squid: bump to version 3.5.10
Message-ID: <1443793300-17630-1-git-send-email-gustavo@zacarias.com.ar>
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
index a67af98..2a7b5f3 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.9.tar.xz.asc
-md5 fe7306a90a0ba2fc906e9a8c741cc8ea  squid-3.5.9.tar.xz
-sha1 4856ca628cafbd1cbfa0ddcbadec440e6f4c2da7  squid-3.5.9.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.10.tar.xz.asc
+md5	5ddc53bd6ff78234691a7ebbcbc6aa38	squid-3.5.10.tar.xz
+sha1	804bbf5ef6ccdc277dacde83e086fad30d02da60	squid-3.5.10.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 641720a..8a05814 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).9
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).10
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.4.9
