From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:09:53 +0100
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.14.1
Message-ID: <20191027090636.62B84800E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=212141b1840bbdc8133e13ec91f82eada90fb099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncdu/ncdu.hash | 5 ++---
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 97ac287c69..ff2f469025 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,6 +1,5 @@
-# From http://dev.yorhel.nl/download/ncdu-1.14.tar.gz.{md5,sha1}
-md5 d26c0aa57728c19969c3c5036fa272a0  ncdu-1.14.tar.gz
-sha1 28c7003ad23d2e3a2d22d2c349bb0c7170752396  ncdu-1.14.tar.gz
+# From https://dev.yorhel.nl/download/ncdu-1.14.1.tar.gz.sha256
+sha256 be31e0e8c13a0189f2a186936f7e298c6390ebdc573bb4a1330bc1fcbf56e13e ncdu-1.14.1.tar.gz
 
 # computed locally
 sha256 a05f1fd38432052dc8588da66b8bf3e9e103e29a82c0b5d72c65d4d9fc830f2e COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 87508f5659..336d413227 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.14
+NCDU_VERSION = 1.14.1
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
