From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:33:56 +0100
Subject: [Buildroot] [git commit] squid: security bump to version 3.5.14
Message-ID: <20160216203412.3E87F7FEEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d389858d0c6de0743cb07674624f4d5b93b3bc4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
SQUID-2016:1 - Remote Denial of service issue in SSL/TLS processing.

CVE-2016-2390 assigned.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 97fb45d..f86c09a 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.13.tar.bz2.asc
-md5	3fccd1c072433bb896374a832f608b7d	squid-3.5.13.tar.bz2
-sha1	9bf3b803752c019cb2ddf15afa20f21fa9d385e3	squid-3.5.13.tar.bz2
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.14.tar.bz2.asc
+md5	d589a2dd8ea8867170cef582e7334442	squid-3.5.14.tar.bz2
+sha1	f6a0262b09f7f463822cbdb50bac8f5dd1213d27	squid-3.5.14.tar.bz2
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index f205da2..2b7a9a2 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).13
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).14
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.bz2
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
