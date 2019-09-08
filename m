From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Sep 2019 18:52:01 +0200
Subject: [Buildroot] [git commit] package/debianutils: bump to version
 4.8.6.3
Message-ID: <20190908164850.15BBB8D4F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f6cf3c1810cdbc530e4ae241661ecc72d07621d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

updated _SITE

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/debianutils/debianutils.hash | 6 ++++--
 package/debianutils/debianutils.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index cd54e0b8b7..e07f405ee9 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,2 +1,4 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.8.1.dsc
-sha256	2c395c0bdcfe89de30828b1d25cc5549ded5225a6d3625fbcb2cc0881ef5f026	debianutils_4.8.1.tar.xz
+# From http://snapshot.debian.org/archive/debian/20190828T161440Z/pool/main/d/debianutils/debianutils_4.8.6.3.dsc
+sha256 2cc7de3afc6df1cf6d00af9938efac7ee8f739228e548e512ddc186b6a7be221 debianutils_4.8.6.3.tar.xz
+# Locally calculated
+sha256 a8698f078cd21fc501e66d070e12cf2f23ec1eaf5841bbc87629de76858ef7a7 debian/copyright
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index 189d983732..a91383c17a 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.8.1
+DEBIANUTILS_VERSION = 4.8.6.3
 DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20161118T033019Z/pool/main/d/debianutils
+DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20190828T161440Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
