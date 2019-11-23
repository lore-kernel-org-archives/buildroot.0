From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2019 21:39:46 +0100
Subject: [Buildroot] [git commit branch/next] package/whois: bump to version
 5.5.3
Message-ID: <20191123203328.36F34817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=293bed3977d65cf0cf3dbd68c4953e86b7e6149b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index ca4c81b3f5..77d30b2cd0 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20190719T170739Z/pool/main/w/whois/whois_5.5.0.dsc
-sha256	64ec63339d7ad559cd6722bd3141a1e5787817bd921841a813ee17a0a34b6f3d	whois_5.5.0.tar.xz
+# From http://snapshot.debian.org/archive/debian/20191118T030126Z/pool/main/w/whois/whois_5.5.3.dsc
+sha256	55c33f9c2a01c0cf1d6449ece63b0c26ef45aab63cf5f01c18459df0e341ab46	whois_5.5.3.tar.xz
 
 # Hash for license file:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 7d36ddc76c..1517d1e630 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.0
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20190719T170739Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.3
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20191118T030126Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
