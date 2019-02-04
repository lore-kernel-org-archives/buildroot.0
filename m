From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 09:54:46 +0100
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.13
Message-ID: <20190204085335.BF6528136B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8b78301147d740aada341c65470c4024ddc9d5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added license hash

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[Thomas: use a sha256 hash for the license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncdu/ncdu.hash | 9 ++++++---
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 8a0c1d16c5..7326a15987 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,3 +1,6 @@
-# From http://dev.yorhel.nl/download/ncdu-1.12.tar.gz.{md5,sha1}
-md5 7365ac46c420bc511621216b1747984f  ncdu-1.12.tar.gz
-sha1 b79b1c44784f334dca74d89a49f49274f14cfeef  ncdu-1.12.tar.gz
+# From http://dev.yorhel.nl/download/ncdu-1.13.tar.gz.{md5,sha1}
+md5 67239592ac41f42290f52ab89ff198be  ncdu-1.13.tar.gz
+sha1 3233c4185208d9989ac528a94817ed92dd59c773  ncdu-1.13.tar.gz
+
+# computed locally
+sha256 0ee47c3742a867ace26eb429cce593b54ab4ccb4c4a97d62e41363cbf80c8a24 COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index d45e62d95c..9a7170d600 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.12
+NCDU_VERSION = 1.13
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
