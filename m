From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 May 2015 12:29:12 +0200
Subject: [Buildroot] [git commit] squid: security bump to version 3.5.4
Message-ID: <20150502102948.665B580417@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fd9f81fec0e8136342f9c412bcb65161ef95bc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-3455 - Incorrect X509 server certificate validation

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash |    6 +++---
 package/squid/squid.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 85f467a..50e2e7b 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.3.tar.xz.asc
-md5	6cd553300a2253c0913f498beb79ee51	squid-3.5.3.tar.xz
-sha1	6919305e16f59387197cf543f525e41f510b4727	squid-3.5.3.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.4.tar.xz.asc
+md5	5b53d5bb47fa033b76857f7956d0c36b	squid-3.5.4.tar.xz
+sha1	71a04a5f7c4c38464a8a08ae1089c47abcea0e49	squid-3.5.4.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index f4d6ae3..745c9ad 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).3
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).4
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
