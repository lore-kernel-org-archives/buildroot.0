From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:12:11 -0700
Subject: [Buildroot] [PATCH 17/27] package/whois: bump to version 5.5.1
Message-ID: <20190908161211.26832-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update _SITE

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index ca4c81b3f5..d1d0a2d1b0 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20190719T170739Z/pool/main/w/whois/whois_5.5.0.dsc
-sha256	64ec63339d7ad559cd6722bd3141a1e5787817bd921841a813ee17a0a34b6f3d	whois_5.5.0.tar.xz
+# From http://ftp.debian.org/debian/pool/main/w/whois/whois_5.5.1.dsc
+sha256 ee8d802f2e6639d44db3c326f3f5e059a8571a8cd0da87e60c6ddb06713cac82 whois_5.5.1.tar.xz
 
 # Hash for license file:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 7d36ddc76c..15027aff64 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.0
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20190719T170739Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.1
+WHOIS_SITE = http://ftp.debian.org/debian/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
-- 
2.20.1
