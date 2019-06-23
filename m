From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:37:32 +0200
Subject: [Buildroot] [git commit] package/whois: bump to version 5.4.3
Message-ID: <20190623103632.96F06837A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f0ede3d3183e3acad144cdce7a4ace433ba6aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See changelog:
 - https://github.com/rfc1036/whois/blob/master/debian/changelog

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 41ef935c1d..4a5c5986d0 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20181026T220636Z/pool/main/w/whois/whois_5.4.0.dsc
-sha256	3775ae0cfaa6dd8d886e5233c4826225cddcb88c99c2a08130d14e15fe58e378	whois_5.4.0.tar.xz
+# From http://snapshot.debian.org/archive/debian/20190622T150200Z/pool/main/w/whois/whois_5.4.3.dsc
+sha256	fefa84029f70985db19743e51c4a8b318a169426babeaa824a27110c26090fc3	whois_5.4.3.tar.xz
 
 # Hash for license file:
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 712ad911d8..a5f013ab40 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.4.0
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20181026T220636Z/pool/main/w/whois
+WHOIS_VERSION = 5.4.3
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20190622T150200Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
