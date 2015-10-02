From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 21:51:25 +0200
Subject: [Buildroot] [git commit] minidlna: bump to version 1.1.5
Message-ID: <20151002195300.6C11A81914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06d653d67d501ed4dccc07cc6afe87ceaa536413
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/minidlna.hash |    5 +++--
 package/minidlna/minidlna.mk   |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/minidlna/minidlna.hash b/package/minidlna/minidlna.hash
index 797679a..d1ed4b9 100644
--- a/package/minidlna/minidlna.hash
+++ b/package/minidlna/minidlna.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  9814c04a2c506a0dd942c4218d30c07dedf90dabffbdef2d308a3f9f23545314  minidlna-1.1.4.tar.gz
+# From http://sourceforge.net/projects/minidlna/files/minidlna/1.1.5/
+md5	1970e553a1eb8a3e7e302e2ce292cbc4	minidlna-1.1.5.tar.gz
+sha1	8185337621f5f9111118d8a4bca1e8cfcdd19505	minidlna-1.1.5.tar.gz
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index ab93484..e9df92b 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIDLNA_VERSION = 1.1.4
+MINIDLNA_VERSION = 1.1.5
 MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
