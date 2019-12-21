From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:07:11 +0100
Subject: [Buildroot] [git commit] package/libebml: bump to version 1.3.10
Message-ID: <20191221215917.1DDD78D3B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5784520ccf89ce23b8a2f74b08f61f57b989a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libebml/libebml.hash | 2 +-
 package/libebml/libebml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index 30945548c5..88511f7b93 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	c6b6c6cd8b20a46203cb5dce636883aef68beb2846f1e4103b660a7da2c9c548	libebml-1.3.9.tar.xz
+sha256	c6a792f4127b8059bc446fb32391e6633811f45748d7d7ba873d7028362f5e3e	libebml-1.3.10.tar.xz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 770fda5dae..549d2f8e6f 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.3.9
+LIBEBML_VERSION = 1.3.10
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
