From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  6 Jun 2018 21:39:03 +0200
Subject: [Buildroot] [PATCH 1/1] whois: bump to version 5.3.1
Message-ID: <20180606193903.3245-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 635066c5e3..e69b95d999 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20180121T094839Z/pool/main/w/whois/whois_5.3.0.dsc
-sha256	4d789c403bfb5833c8ae168a5f31be70e34b045bd5d95a54c82a27b0ff135723	whois_5.3.0.tar.xz
+# From http://snapshot.debian.org/archive/debian/20180522T155750Z/pool/main/w/whois/whois_5.3.1.dsc
+sha256	ef4ead31306a388d9c8c83d67f56c94ed8b4c85e94f60baea2f5b1660445893e	whois_5.3.1.tar.xz
 
 # Hash for license file:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 5cd7cde7fd..c9203d8c0d 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.3.0
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20180121T094839Z/pool/main/w/whois
+WHOIS_VERSION = 5.3.1
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20180522T155750Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox) $(TARGET_NLS_DEPENDENCIES)
-- 
2.14.1
