From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:45:19 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.5.11
Message-ID: <20151103145129.AA0B880480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=010bac1ba8a29779f5e145c3eeeb3e798e58ee41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash |    6 +++---
 package/squid/squid.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 2a7b5f3..8d81862 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.10.tar.xz.asc
-md5	5ddc53bd6ff78234691a7ebbcbc6aa38	squid-3.5.10.tar.xz
-sha1	804bbf5ef6ccdc277dacde83e086fad30d02da60	squid-3.5.10.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.11.tar.xz.asc
+md5	eb5e1cf3cf012e5b85d6f7ca78b7afab	squid-3.5.11.tar.xz
+sha1	623e0d4a41ddc70e0f59a3f38c091e0dc946172c	squid-3.5.11.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 8a05814..7471488 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).10
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).11
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
