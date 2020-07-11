From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:25:03 +0200
Subject: [Buildroot] [git commit] package/dhcpcd: bump version to 9.1.4
Message-ID: <20200711132133.136FD840BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=809f548e79c6c099f1fa3e3728d90842be7059a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also separate the fields in the hash file by two spaces and change the
hash of the license file (copyright message changed from 2019 to 2020).

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcpcd/dhcpcd.hash | 6 +++---
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index c0d68036f3..6991e73680 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-8.0.3.tar.xz.distinfo
-sha256	9674971fcd5acd5a3401a0ad8eba7f0b816fec9abb4a2520332b4d8dae068f1d	dhcpcd-8.0.3.tar.xz
+# sha256 from ftp://roy.marples.name/pub/dhcpcd/dhcpcd-9.1.4.tar.xz.distinfo
+sha256  5fe133e5497d8af6d26bd6e6b8dd48ab12d124d6cc4cefe6de6536ff97f76820  dhcpcd-9.1.4.tar.xz
 # Locally calculated
-sha256	213fc1a704cecdb322276fa7c95891fd1c23137d9ab572af1fc5e91b48762303	LICENSE
+sha256  9cce1077bad23544349788ec750ec6e5aee106fc437fd6b5d73c0d8510426578  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 63dbbee86c..a40696924c 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 8.0.3
+DHCPCD_VERSION = 9.1.4
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
