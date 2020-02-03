From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 21:16:44 +0100
Subject: [Buildroot] [git commit] package/whois: bump to version 5.5.5
Message-ID: <20200203200907.0663188E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6373ff05de78b340d58e580c3602f0b41256065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 77d30b2cd0..b83ea68d28 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20191118T030126Z/pool/main/w/whois/whois_5.5.3.dsc
-sha256	55c33f9c2a01c0cf1d6449ece63b0c26ef45aab63cf5f01c18459df0e341ab46	whois_5.5.3.tar.xz
+# From http://snapshot.debian.org/archive/debian/20200123T155144Z/pool/main/w/whois/whois_5.5.5.dsc
+sha256	c30e8a444482eadac157be42649833ef77c5ea9fb5cbcbabb6ee3f2254e5530d	whois_5.5.5.tar.xz
 
 # Hash for license file:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 1517d1e630..9d29c2f852 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.3
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20191118T030126Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.5
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20200123T155144Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
