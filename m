From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:38 -0000
Subject: [Buildroot] [git commit] package/whois: bump to version 5.5.0
Message-ID: <20190903133620.1E28D81413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9419ff2cf5bba6b37d583e6677aef27597da2e30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 4a5c5986d0..ca4c81b3f5 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20190622T150200Z/pool/main/w/whois/whois_5.4.3.dsc
-sha256	fefa84029f70985db19743e51c4a8b318a169426babeaa824a27110c26090fc3	whois_5.4.3.tar.xz
+# From http://snapshot.debian.org/archive/debian/20190719T170739Z/pool/main/w/whois/whois_5.5.0.dsc
+sha256	64ec63339d7ad559cd6722bd3141a1e5787817bd921841a813ee17a0a34b6f3d	whois_5.5.0.tar.xz
 
 # Hash for license file:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index a5f013ab40..7d36ddc76c 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.4.3
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20190622T150200Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.0
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20190719T170739Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
