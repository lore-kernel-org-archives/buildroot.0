From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 21:16:56 +0100
Subject: [Buildroot] [git commit] package/qwt: bump to version 6.1.4
Message-ID: <20200113201115.1D4D181751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba532ccf218d141dc505f765a15d4926a8bba0c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qwt/qwt.hash | 10 +++++++---
 package/qwt/qwt.mk   |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index a0077a6804..95e910e5e4 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,3 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.3/
-sha1 90ec21bc42f7fae270482e1a0df3bc79cb10e5c7  qwt-6.1.3.tar.bz2
-md5  19d1f5fa5e22054d22ee3accc37c54ba          qwt-6.1.3.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.1.4/
+sha1 a1028cb0a33322920266fb183869023b8ed30394  qwt-6.1.4.tar.bz2
+md5  4fb1852f694420e3ab9c583526edecc5          qwt-6.1.4.tar.bz2
+
+# Locally computed
+sha256 1529215329e51fc562e0009505a838f427919a18b362afff441f035b2d9b5bd9  qwt-6.1.4.tar.bz2
+sha256 d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index f381ebbb7a..e0ffec765f 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.3
+QWT_VERSION = 6.1.4
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
