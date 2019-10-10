From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:53:24 +0200
Subject: [Buildroot] [git commit] package/cutelyst: bump to version 2.9.0
Message-ID: <20191010204742.0AC438CA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=828555061025919a1686a594cb4377621bfac12a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cutelyst/cutelyst.hash | 2 +-
 package/cutelyst/cutelyst.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
index 87506ab90c..e9c1161969 100644
--- a/package/cutelyst/cutelyst.hash
+++ b/package/cutelyst/cutelyst.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f87c2f04b148a50f5df13aa5d75b45bf20e56be2e2cd6e17c2aef5231db4b467    cutelyst-2.7.0.tar.gz
+sha256  5036378d0d8242da68f61bc2f51fc37b881b720311073b6f6cfb113cbae18a40    cutelyst-2.9.0.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551    COPYING
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 42a317e765..709d9443ca 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTELYST_VERSION = 2.7.0
+CUTELYST_VERSION = 2.9.0
 CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
 CUTELYST_INSTALL_STAGING = YES
 CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
