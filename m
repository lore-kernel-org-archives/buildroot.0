From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 16:03:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.5.9
Message-ID: <20210405140310.4134328-1-fontaine.fabrice@gmail.com>
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
index 8bdbf4bb20..699616ef1d 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20210216T023642Z/pool/main/w/whois/whois_5.5.8.dsc
-sha256  cd9e7bad3b6968182bfcc311e22be3aec9a974397377d748845147884ce07547  whois_5.5.8.tar.xz
+# From http://snapshot.debian.org/archive/debian/20210328T030002Z/pool/main/w/whois/whois_5.5.9.dsc
+sha256  69088241ed33d2204f153c8005b312a69b60a1429075ff49f42f9f1f73a19c19  whois_5.5.9.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index a09624a7b5..53bbe85f08 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.8
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210216T023642Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.9
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210328T030002Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.30.2
