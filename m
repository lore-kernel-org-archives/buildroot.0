From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 09:43:24 +0200
Subject: [Buildroot] [git commit branch/next] package/gcr: bump to version
 3.28.1
Message-ID: <20190524073946.F184E8D6DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d5376566e630f1bf9e201129213126541688897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcr/gcr.hash | 5 +++--
 package/gcr/gcr.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
index 8b8b748b9e..a78f56517d 100644
--- a/package/gcr/gcr.hash
+++ b/package/gcr/gcr.hash
@@ -1,2 +1,3 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.20/gcr-3.20.0.sha256sum
-sha256	90572c626d8a708225560c42b4421f7941315247fa1679d4ef569bde7f4bb379	gcr-3.20.0.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.28/gcr-3.28.1.sha256sum
+sha256	95204aa2111c301778ebfbe60975ce3ed698c958430ffcc2a785ac5e593d168b	gcr-3.28.1.tar.xz
+sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 7cb35af836..7cf7ea79e5 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GCR_VERSION_MAJOR = 3.20
-GCR_VERSION = $(GCR_VERSION_MAJOR).0
+GCR_VERSION_MAJOR = 3.28
+GCR_VERSION = $(GCR_VERSION_MAJOR).1
 GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
 GCR_DEPENDENCIES = host-intltool host-pkgconf libgcrypt libglib2 p11-kit
