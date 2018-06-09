From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 Jun 2018 16:41:15 +0200
Subject: [Buildroot] [git commit] aubio: bump to version 0.4.6
Message-ID: <20180609144026.21FEE8634B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc90a068d794cbb281c819c8ba46dd1f881efa9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aubio/aubio.hash | 7 +++++--
 package/aubio/aubio.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/aubio/aubio.hash b/package/aubio/aubio.hash
index b4233aee72..edb63f0769 100644
--- a/package/aubio/aubio.hash
+++ b/package/aubio/aubio.hash
@@ -1,2 +1,5 @@
-# From https://aubio.org/pub/aubio-0.4.5.tar.bz2.sha256
-sha256 70c2804e6f4fbf0ebc0fb9ac8cc9d465ef4a4d438311c074c9a7364e98827af6  aubio-0.4.5.tar.bz2
+# From https://aubio.org/pub/aubio-0.4.6.tar.bz2.sha256
+sha256 bdc73be1f007218d3ea6d2a503b38a217815a0e2ccc4ed441f6e850ed5d47cfb  aubio-0.4.6.tar.bz2
+
+# Hash for license file:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index 2a09ebb3b5..b0cc8b899e 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUBIO_VERSION = 0.4.5
+AUBIO_VERSION = 0.4.6
 AUBIO_SITE = https://aubio.org/pub
 AUBIO_SOURCE = aubio-$(AUBIO_VERSION).tar.bz2
 AUBIO_LICENSE = GPL-3.0+
