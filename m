From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  8 Apr 2020 23:05:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.5.6
Message-ID: <20200408210500.542094-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.hash | 6 +++---
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index b83ea68d28..4dc4c3e220 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20200123T155144Z/pool/main/w/whois/whois_5.5.5.dsc
-sha256	c30e8a444482eadac157be42649833ef77c5ea9fb5cbcbabb6ee3f2254e5530d	whois_5.5.5.tar.xz
+# From http://snapshot.debian.org/archive/debian/20200216T145122Z/pool/main/w/whois/whois_5.5.6.dsc
+sha256  cba1e9000c60950f46a96ba23e8eea8aee240a2b8560e63a6bfb33f9034af14e  whois_5.5.6.tar.xz
 
 # Hash for license file:
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 417f5c76af..a96f20caae 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.5
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20200123T155144Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.6
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20200216T145122Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.25.1
