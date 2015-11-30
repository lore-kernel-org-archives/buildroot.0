From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Nov 2015 13:06:37 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.5.12
Message-ID: <20151201232124.EEB92821F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2940576b0b5ea4d69e8043da6a3ab46bd2f2bed8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 8d81862..c806dc9 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.11.tar.xz.asc
-md5	eb5e1cf3cf012e5b85d6f7ca78b7afab	squid-3.5.11.tar.xz
-sha1	623e0d4a41ddc70e0f59a3f38c091e0dc946172c	squid-3.5.11.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.12.tar.xz.asc
+md5	50016bf6e2d3a3a186a6c7236d251f63	squid-3.5.12.tar.xz
+sha1	59b0dcb2c9c04f1a0586f7a1f346197ddb6d5be5	squid-3.5.12.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7471488..dcaab0a 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).11
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).12
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
