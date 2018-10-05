From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 14:03:55 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] imlib2: update license
Message-ID: <20181005120259.881C28D312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e807ae6a9e35eb4d69ba506f6d38ac93f630bd2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

- Use SPDX short identifier (Imlib2) instead of full name
- Add COPYING-PLAIN to license files
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e29fcc14809dcd34f2bccc0fb949ee2cd46489ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imlib2/imlib2.hash | 4 ++++
 package/imlib2/imlib2.mk   | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
index 0c234c8c23..62ebac32ea 100644
--- a/package/imlib2/imlib2.hash
+++ b/package/imlib2/imlib2.hash
@@ -1,3 +1,7 @@
 # From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.4.10/
 md5 a0de8524592bbd9f24fcc6cb8352137c  imlib2-1.4.10.tar.bz2
 sha1 664df65c6265a2825d685d2f3a4f0d072eb626ac  imlib2-1.4.10.tar.bz2
+
+# Locally computed
+sha256 fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
+sha256 8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index b5012a69a8..21a96cb1ca 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -7,8 +7,8 @@
 IMLIB2_VERSION = 1.4.10
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)
-IMLIB2_LICENSE = imlib2 license
-IMLIB2_LICENSE_FILES = COPYING
+IMLIB2_LICENSE = Imlib2
+IMLIB2_LICENSE_FILES = COPYING COPYING-PLAIN
 
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
