From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 4 Apr 2017 10:34:49 +0100
Subject: [Buildroot] [PATCH] squid: bump version to 3.5.25
Message-ID: <20170404093449.40141-1-Vincent.Riera@imgtec.com>
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
index d9b7924..95762bc 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.24.tar.xz.asc
-md5 3fae511e16b6379b61c011914673973d  squid-3.5.24.tar.xz
-sha1 f203637783301a4b86e554b6dd226de721762ae5  squid-3.5.24.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.25.tar.xz.asc
+md5 6b7dd7b42b1adacf08f3155640ea2782  squid-3.5.25.tar.xz
+sha1 63ea00cb918e3106fd91b286ec907f1681e0f0e8  squid-3.5.25.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 263ce16..d71f724 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).24
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).25
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPL-2.0+
-- 
2.10.2
