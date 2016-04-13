From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 21:40:02 +0200
Subject: [Buildroot] [git commit] libtasn1: bump to version 4.8
Message-ID: <20160413194044.3CB5C81DDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c05e4b0df668911484cfb8bb637fe0457ed26e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtasn1/libtasn1.hash | 2 +-
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 41e10a6..dc65210 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	3462fc25e2d2536878c39a8825f5e36ba2e2611b27ef535e064f4c56258e508b	libtasn1-4.6.tar.gz
+sha256	fa802fc94d79baa00e7397cedf29eb6827d4bd8b4dd77b577373577c93a8c513	libtasn1-4.8.tar.gz
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 701e0e1..c51d8c0 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.6
+LIBTASN1_VERSION = 4.8
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+, LGPLv2.1+
