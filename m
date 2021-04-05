From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Apr 2021 11:04:31 +0200
Subject: [Buildroot] [git commit] package/libvips: bump to version 8.10.6
Message-ID: <20210405083909.938AC8BE57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94fa503d7b388d917840d84b367427bca18187dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/libvips/libvips/blob/v8.10.6/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvips/libvips.hash | 4 ++--
 package/libvips/libvips.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libvips/libvips.hash b/package/libvips/libvips.hash
index ba40e6dbbe..1ba242d1cf 100644
--- a/package/libvips/libvips.hash
+++ b/package/libvips/libvips.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c5e4dd5a5c6a777c129037d19ca606769b3f1d405fcc9c8eeda906a61491f790  vips-8.8.3.tar.gz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  2468088d958e0e2de1be2991ff8940bf45664a826c0dad12342e1804e2805a6e  vips-8.10.6.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index bc12b7198d..f7b15e8e06 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVIPS_VERSION = 8.8.3
+LIBVIPS_VERSION = 8.10.6
 LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
 LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
 LIBVIPS_LICENSE = LGPL-2.1+
