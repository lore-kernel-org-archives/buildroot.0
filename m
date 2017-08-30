From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:30:09 +0200
Subject: [Buildroot] [git commit] libftdi1: bump to version 1.4
Message-ID: <20170902130620.CB2038016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b191d64d381a08d4bff4e004b273b4b0e89bc06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Daniel Sangue <daniel.sangue@sangue.ch>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libftdi1/libftdi1.hash | 5 +++--
 package/libftdi1/libftdi1.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index 0a89182..40512a7 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,2 +1,3 @@
-# Locally computed (after checking the signature from http://www.intra2net.com/en/developer/libftdi/download.php)
-sha256  9a8c95c94bfbcf36584a0a58a6e2003d9b133213d9202b76aec76302ffaa81f4  libftdi1-1.3.tar.bz2
+# Locally computed after checking the signature
+# https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.4.tar.bz2.sig
+sha256  ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681cb31b74  libftdi1-1.4.tar.bz2
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 6b84b95..c45c83a 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = 1.3
+LIBFTDI1_VERSION = 1.4
 LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
