From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Dec 2018 22:20:30 +0100
Subject: [Buildroot] [git commit] package/c-ares: bump to version 1.15.0
Message-ID: <20181202071602.3B4198131E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6dc02327a5088c89413174b90d562ef1ca345ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 0c665574d8..a3599aaa11 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 45d3c1fd29263ceec2afc8ff9cd06d5f8f889636eb4e80ce3cc7f0eaf7aadc6e c-ares-1.14.0.tar.gz
+sha256 6cdb97871f2930530c97deb7cf5c8fa4be5a0b02c7cea6e7c7667672a39d6852 c-ares-1.15.0.tar.gz
 
 # Hash for license file
 sha256 db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 9f9835677f..f9e440d9b1 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.14.0
+C_ARES_VERSION = 1.15.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
