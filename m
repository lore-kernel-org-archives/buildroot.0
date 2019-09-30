From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:16:01 +0200
Subject: [Buildroot] [git commit] package/x265: bump version to 3.2
Message-ID: <20190930211446.4618383FFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75cba0b5ec8f4e32506fa5a431228da139d63931
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x265/x265.hash | 4 +++-
 package/x265/x265.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 7cdb02be02..96a53b8abe 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,3 +1,5 @@
+# From https://bitbucket.org/multicoreware/x265/wiki/Home
+md5 374e6359a00d17fd82195c02c341c861  x265_3.2.tar.gz
 # Locally generated
-sha256 6f785f1c9a42e00a56402da88463bb861c49d9af108be53eb3ef10295f2a59aa  x265_3.1.2.tar.gz
+sha256 364d79bcd56116a9e070fdeb1d9d2aaef1a786b4970163fb56ff0991a183133b  x265_3.2.tar.gz
 sha256 d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 74a46e37a2..ccb46bf251 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 3.1.2
+X265_VERSION = 3.2
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
