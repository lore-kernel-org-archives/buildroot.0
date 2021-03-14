From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Mar 2021 22:22:27 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libebml: bump to
 version 1.4.0
Message-ID: <20210314210721.7021687770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=391331d77c69209b20638f6c348c55d748dd49d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 89fe7e140b67fbd4e202572c615bf407029b50d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libebml/libebml.hash | 4 ++--
 package/libebml/libebml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index 88511f7b93..f06924076e 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	c6a792f4127b8059bc446fb32391e6633811f45748d7d7ba873d7028362f5e3e	libebml-1.3.10.tar.xz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL
+sha256  80abc9a82549615018798ee704997270a39b43de9a6e7e0d23b62f8ce682c4b3  libebml-1.4.0.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 549d2f8e6f..911093f5ce 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.3.10
+LIBEBML_VERSION = 1.4.0
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
