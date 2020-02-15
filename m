From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 11:58:38 +0100
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.14.2
Message-ID: <20200215105640.967E08E0BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84140d000702ead2fb62cfbd3d9244873b691668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncdu/ncdu.hash | 6 +++---
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index ff2f469025..285dc9bfa4 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,5 +1,5 @@
-# From https://dev.yorhel.nl/download/ncdu-1.14.1.tar.gz.sha256
-sha256 be31e0e8c13a0189f2a186936f7e298c6390ebdc573bb4a1330bc1fcbf56e13e ncdu-1.14.1.tar.gz
+# From https://dev.yorhel.nl/download/ncdu-1.14.2.tar.gz.sha256
+sha256 947a7f5c1d0cd4e338e72b4f5bc5e2873651442cec3cb012e04ad2c37152c6b1 ncdu-1.14.2.tar.gz
 
 # computed locally
-sha256 a05f1fd38432052dc8588da66b8bf3e9e103e29a82c0b5d72c65d4d9fc830f2e COPYING
+sha256 978f49428f21714c973706030c0ef09983cc1e2889a1b7b521dbf8860870cf05 COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 336d413227..681c8bd87a 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.14.1
+NCDU_VERSION = 1.14.2
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
