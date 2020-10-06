From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 20:53:42 +0200
Subject: [Buildroot] [git commit] package/whois: bump to version 5.5.7
Message-ID: <20201006184308.D21298D69F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d5144d540b0a0f800073f6997d6d6565839f8bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 4dc4c3e220..f42db356a5 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20200216T145122Z/pool/main/w/whois/whois_5.5.6.dsc
-sha256  cba1e9000c60950f46a96ba23e8eea8aee240a2b8560e63a6bfb33f9034af14e  whois_5.5.6.tar.xz
+# From http://snapshot.debian.org/archive/debian/20201003T204015Z/pool/main/w/whois/whois_5.5.7.dsc
+sha256  3efa700dbf38d127c31b21af3176cd6e5a69f96a056be60ac1dcd13df7717393  whois_5.5.7.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index a96f20caae..7d684922b7 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.6
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20200216T145122Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.7
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20201003T204015Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
