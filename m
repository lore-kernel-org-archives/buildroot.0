From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:16:43 +0100
Subject: [Buildroot] [git commit] mpfr: bump to version 3.1.4
Message-ID: <20160308201646.C437F801E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68578be550a72d2caf61bc19d5d394bf667fffdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpfr/mpfr.hash | 2 +-
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 8b6dc86..a8b642b 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	6835a08bd992c8257641791e9a6a2b35b02336c8de26d0a8577953747e514a16	mpfr-3.1.3.tar.xz
+sha256	761413b16d749c53e2bfd2b1dfaa3b027b0e793e404b90b5fbaeef60af6517f5	mpfr-3.1.4.tar.xz
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index ec16d1c..5c3a6ef 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 3.1.3
+MPFR_VERSION = 3.1.4
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPLv3+
