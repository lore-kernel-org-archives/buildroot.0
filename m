From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:06:28 +0200
Subject: [Buildroot] [git commit] package/libmatroska: bump to version 1.6.2
Message-ID: <20200902161639.7B71085EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5da95fed2719cb8c66714238daca206504914a89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extract from ChangeLog:
 - In release 1.6.1 the version number in CMakeLists.txt wasn't
   updated, affecting the installed cmake and pkgconfig files. The
   version number has been bumped to 1.6.2 in all relevant files now.
 - "KaxBlockAddIDValue" class: this class is no longer marked as
   "mandatory" in order to coincide with the latest specification.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmatroska/libmatroska.hash | 2 +-
 package/libmatroska/libmatroska.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmatroska/libmatroska.hash b/package/libmatroska/libmatroska.hash
index 0ef5278e76..4c3d754f8f 100644
--- a/package/libmatroska/libmatroska.hash
+++ b/package/libmatroska/libmatroska.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fec89cebd500807f7fd14b56c14733f11045fa2a21398ff6f6c5c0e3e01b4033  libmatroska-1.6.0.tar.xz
+sha256  bc4479aa8422ab07643df6a1fa5a19e4bed4badfd41ca77e081628620d1e1990  libmatroska-1.6.2.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 58f033ad8e..61222c2bf7 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMATROSKA_VERSION = 1.6.0
+LIBMATROSKA_VERSION = 1.6.2
 LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.xz
 LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
