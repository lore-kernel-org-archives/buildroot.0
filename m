From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 4 Apr 2016 10:31:04 +0100
Subject: [Buildroot] [PATCH 2/3] squid: bump version to 3.5.16
In-Reply-To: <1459762265-5543-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1459762265-5543-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1459762265-5543-2-git-send-email-Vincent.Riera@imgtec.com>
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
index 106bde6..37cfaa1 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.15.tar.bz2.asc
-md5	59d6732a4ebd3f63e2164d9847dc37c0	squid-3.5.15.tar.bz2
-sha1	72279380ea94aa731f5cf82f3fb50f9250f1692a	squid-3.5.15.tar.bz2
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.16.tar.bz2.asc
+md5 ab9c92f4a579e056cd8afafa0a95f612  squid-3.5.16.tar.bz2
+sha1 f3a2b8a7451b79d24e8fd166306e2c7248ef3be9  squid-3.5.16.tar.bz2
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index b4341ba..b2e0c98 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).15
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).16
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.bz2
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.7.3
