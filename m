From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 23:24:31 +0200
Subject: [Buildroot] [git commit] package/fltk: bump to version 1.3.5
Message-ID: <20190920211953.0BEA28ED59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f747238759e5d7001f4f609d65406ecb32712a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fltk/fltk.hash | 7 ++++---
 package/fltk/fltk.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/fltk/fltk.hash b/package/fltk/fltk.hash
index af968aac75..f3430e41f9 100644
--- a/package/fltk/fltk.hash
+++ b/package/fltk/fltk.hash
@@ -1,4 +1,5 @@
-# From http://www.fltk.org/software.php?VERSION=1.3.4
-md5 d7fcd27ab928648e1a1366dd2e273970 fltk-1.3.4-1-source.tar.gz
+# From http://www.fltk.org/software.php?VERSION=1.3.5
+md5 e85017defd5a03ae82e634311db87bbf fltk-1.3.5-source.tar.gz
 # Locally generated
-sha256 7fb2c8882433ce694e6900c94fda505e8f4ed3fa9c7e597007098a33b85c53f4  fltk-1.3.4-1-source.tar.gz
+sha256 8729b2a055f38c1636ba20f749de0853384c1d3e9d1a6b8d4d1305143e115702  fltk-1.3.5-source.tar.gz
+sha256 57dd381e713fb309fb7dd85c3c38b274557ecb333475d0f1d65a5f06ad85c9a6  COPYING
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index c37a13176c..763ff612d3 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLTK_VERSION = 1.3.4
-FLTK_SOURCE = fltk-$(FLTK_VERSION)-1-source.tar.gz
+FLTK_VERSION = 1.3.5
+FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
 FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
 # We force --libdir=/usr/lib, because by default, it is set to
