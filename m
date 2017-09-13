From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Sep 2017 11:51:19 +0200
Subject: [Buildroot] [git commit] package/ncdu: bump version to 1.12
Message-ID: <20170913094504.5A2CA801E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91eede2c247c2551a1b97d87f529561def54b7f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncdu/ncdu.hash | 6 +++---
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 4bdda40..8a0c1d1 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,3 +1,3 @@
-# From http://dev.yorhel.nl/download/ncdu-1.11.tar.gz.{md5,sha1}
-md5   9e44240a5356b029f05f0e70a63c4d12          ncdu-1.11.tar.gz
-sha1  8f22d713e6d2b28e1f501eee2bd1e03b55550c8d  ncdu-1.11.tar.gz
+# From http://dev.yorhel.nl/download/ncdu-1.12.tar.gz.{md5,sha1}
+md5 7365ac46c420bc511621216b1747984f  ncdu-1.12.tar.gz
+sha1 b79b1c44784f334dca74d89a49f49274f14cfeef  ncdu-1.12.tar.gz
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index bccbb8d..d45e62d 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.11
+NCDU_VERSION = 1.12
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
