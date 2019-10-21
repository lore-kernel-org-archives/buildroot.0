From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 21:15:41 +0200
Subject: [Buildroot] [git commit] package/gnuradio: bump version to 3.7.13.5
Message-ID: <20191021190945.7A62D837E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e07bfaad4036b3f07abe89a003127620f830449
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash for the tarball is not present in
http://gnuradio.org/releases/gnuradio/sha256sums so we provide a self-
computed hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/gnuradio.hash | 6 ++----
 package/gnuradio/gnuradio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index 884f7ae758..e47984e360 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,5 +1,3 @@
-# From http://gnuradio.org/releases/gnuradio/sha256sums
-sha256 1e07ce40fa3c3eede1fb54e320dad8a221a3c01de341e9cef2d7b265ed06a6e9  gnuradio-3.7.13.3.tar.gz
-
-# Hash for license file:
+# Locally computed
+sha256 f14e1f8efbcbe04336b6981da207ada3306a8f08af2c0b4e9bb6f8b93036bbb9  gnuradio-3.7.13.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index ef9723cb01..9a989ad117 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.7.13.3
-GNURADIO_SITE = http://gnuradio.org/releases/gnuradio
+GNURADIO_VERSION = 3.7.13.5
+GNURADIO_SITE = https://gnuradio.org/releases/gnuradio
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
 
