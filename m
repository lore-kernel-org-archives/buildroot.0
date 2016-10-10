From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Oct 2016 12:50:10 -0300
Subject: [Buildroot] [PATCH 2/2] squid: bump to version 3.5.22
In-Reply-To: <1476114610-11134-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476114610-11134-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1476114610-11134-2-git-send-email-gustavo@zacarias.com.ar>
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
index 30eed50..3b2f2de 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.21.tar.xz.asc
-md5 e6745a6e4ac0b48b7283861f64a40ae5  squid-3.5.21.tar.xz
-sha1 38c4f801a17e27ea530fef88c6ee24b42f08529c  squid-3.5.21.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.22.tar.xz.asc
+md5 afb82d2748c06c95815c171463b4aa14  squid-3.5.22.tar.xz
+sha1 73e9199dd9d2a7f107f78d03454830713a4a571d  squid-3.5.22.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index c8a7248..ddd0b83 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).21
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).22
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
-- 
2.7.3
