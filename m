From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Jun 2017 11:32:20 +0100
Subject: [Buildroot] [PATCH] squid: bump version to 3.5.26
Message-ID: <20170602103220.64488-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 95762bc8b..91ba9e6fc 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.25.tar.xz.asc
-md5 6b7dd7b42b1adacf08f3155640ea2782  squid-3.5.25.tar.xz
-sha1 63ea00cb918e3106fd91b286ec907f1681e0f0e8  squid-3.5.25.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.26.tar.xz.asc
+md5 510e2c84773879c00d0e7ced997864d9  squid-3.5.26.tar.xz
+sha1 51a664217957b35de8b7fae180b9f93a759a4204  squid-3.5.26.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index d71f72480..976ce6d85 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).25
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).26
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPL-2.0+
-- 
2.13.0
