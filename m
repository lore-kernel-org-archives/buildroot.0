From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:21:45 +0100
Subject: [Buildroot] [git commit] package/pngquant: bump version to 2.13.1
Message-ID: <20201205200617.6457581A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1796fab31748a16355eb486e230f611d147b9842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes.

Changelog:
https://raw.githubusercontent.com/kornelski/pngquant/master/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pngquant/pngquant.hash | 4 ++--
 package/pngquant/pngquant.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pngquant/pngquant.hash b/package/pngquant/pngquant.hash
index f67807cb8f..c73321670c 100644
--- a/package/pngquant/pngquant.hash
+++ b/package/pngquant/pngquant.hash
@@ -1,4 +1,4 @@
 # From https://pngquant.org/releases.html
-sha256 3638936cf6270eeeaabcee42e10768d78e4dc07cac9310307835c1f58b140808  pngquant-2.12.5-src.tar.gz
+sha256  4b911a11aa0c35d364b608c917d13002126185c8c314ba4aa706b62fd6a95a7a  pngquant-2.13.1-src.tar.gz
 # Locally computed
-sha256 e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
+sha256  e4f467f7abf860b4e620f5f60fdd88bc3a63a0fdb98a481fb002b5e511c9b826  COPYRIGHT
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index a8845c7972..c5a17e872a 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PNGQUANT_VERSION = 2.12.5
+PNGQUANT_VERSION = 2.13.1
 PNGQUANT_SOURCE = pngquant-$(PNGQUANT_VERSION)-src.tar.gz
 PNGQUANT_SITE = https://pngquant.org
 PNGQUANT_LICENSE = GPL-3.0+
