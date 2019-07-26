From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 22:56:56 +0200
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.14
Message-ID: <20190726205458.538AC88075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1430cdd0e63db0740986eb473ba4f3531d2d11d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file hash has changed due to a copyright year change. The
licensing terms remain unchanged.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncdu/ncdu.hash | 8 ++++----
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 7326a15987..97ac287c69 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,6 +1,6 @@
-# From http://dev.yorhel.nl/download/ncdu-1.13.tar.gz.{md5,sha1}
-md5 67239592ac41f42290f52ab89ff198be  ncdu-1.13.tar.gz
-sha1 3233c4185208d9989ac528a94817ed92dd59c773  ncdu-1.13.tar.gz
+# From http://dev.yorhel.nl/download/ncdu-1.14.tar.gz.{md5,sha1}
+md5 d26c0aa57728c19969c3c5036fa272a0  ncdu-1.14.tar.gz
+sha1 28c7003ad23d2e3a2d22d2c349bb0c7170752396  ncdu-1.14.tar.gz
 
 # computed locally
-sha256 0ee47c3742a867ace26eb429cce593b54ab4ccb4c4a97d62e41363cbf80c8a24 COPYING
+sha256 a05f1fd38432052dc8588da66b8bf3e9e103e29a82c0b5d72c65d4d9fc830f2e COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 9a7170d600..87508f5659 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.13
+NCDU_VERSION = 1.14
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
