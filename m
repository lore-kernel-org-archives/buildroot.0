From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 21:29:43 +0100
Subject: [Buildroot] [git commit] package/libnice: bump version to 0.1.16
Message-ID: <20191216205208.EED648B6DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7b2e324e1b3ac437f5c0e915fd3007ca4b9c432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/nice/2018-December/001443.html
https://lists.freedesktop.org/archives/nice/2019-May/001444.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnice/libnice.hash | 2 +-
 package/libnice/libnice.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index 3c1f0d845a..61be9517e3 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-sha256 be120ba95d4490436f0da077ffa8f767bf727b82decf2bf499e39becc027809c libnice-0.1.14.tar.gz
+sha256 06b678066f94dde595a4291588ed27acd085ee73775b8c4e8399e28c01eeefdf libnice-0.1.16.tar.gz
 
 # Hash for license files:
 sha256 9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5 COPYING
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 49c29f9a60..b2fea4d66c 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.14
+LIBNICE_VERSION = 0.1.16
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
