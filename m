From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 21:47:07 +0200
Subject: [Buildroot] [git commit] package/ncdu: bump to version 1.15.1
Message-ID: <20200726194558.2C23E8898A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=718b25b65580c10e340e0c9b38ac1760ec711e2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated indentation in hash file (two spaces)

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncdu/ncdu.hash | 6 +++---
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 285dc9bfa4..be2b6e0788 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,5 +1,5 @@
-# From https://dev.yorhel.nl/download/ncdu-1.14.2.tar.gz.sha256
-sha256 947a7f5c1d0cd4e338e72b4f5bc5e2873651442cec3cb012e04ad2c37152c6b1 ncdu-1.14.2.tar.gz
+# From https://dev.yorhel.nl/ncdu
+sha256  b02ddc4dbf1db139cc6fbbe2f54a282770380f0ca5c17089855eab52a9ea3fb0  ncdu-1.15.1.tar.gz
 
 # computed locally
-sha256 978f49428f21714c973706030c0ef09983cc1e2889a1b7b521dbf8860870cf05 COPYING
+sha256  978f49428f21714c973706030c0ef09983cc1e2889a1b7b521dbf8860870cf05  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 681c8bd87a..532f145b20 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.14.2
+NCDU_VERSION = 1.15.1
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
