From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:58:30 +0100
Subject: [Buildroot] [git commit] package/whois: bump to version 5.5.8
Message-ID: <20210316203639.4281287765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd8813f90533db5caad54fb07c5799777c8ceeeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index f42db356a5..8bdbf4bb20 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20201003T204015Z/pool/main/w/whois/whois_5.5.7.dsc
-sha256  3efa700dbf38d127c31b21af3176cd6e5a69f96a056be60ac1dcd13df7717393  whois_5.5.7.tar.xz
+# From http://snapshot.debian.org/archive/debian/20210216T023642Z/pool/main/w/whois/whois_5.5.8.dsc
+sha256  cd9e7bad3b6968182bfcc311e22be3aec9a974397377d748845147884ce07547  whois_5.5.8.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 7d684922b7..a09624a7b5 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.7
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20201003T204015Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.8
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210216T023642Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
