From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Dec 2016 21:24:41 +0100
Subject: [Buildroot] [git commit] squid: security bump to version 3.5.23
Message-ID: <20161218203346.5112B8007C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9ef4c1f794978928d32304198765026737d810d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-10002: http://www.squid-cache.org/Advisories/SQUID-2016_11.txt
CVE-2016-10003: http://www.squid-cache.org/Advisories/SQUID-2016_10.txt

[Peter: add CVE references]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 3b2f2de..c5251fd 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.22.tar.xz.asc
-md5 afb82d2748c06c95815c171463b4aa14  squid-3.5.22.tar.xz
-sha1 73e9199dd9d2a7f107f78d03454830713a4a571d  squid-3.5.22.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.23.tar.xz.asc
+md5 9b68f689e3d9578932b9c6a4041037c2  squid-3.5.23.tar.xz
+sha1 33e43869d5eeb0fdfd1d625e6d6edee0617b2b22  squid-3.5.23.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index ddd0b83..e664122 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).22
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).23
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
