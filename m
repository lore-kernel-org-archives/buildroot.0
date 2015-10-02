From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 14:24:14 -0300
Subject: [Buildroot] [PATCH] minidlna: bump to version 1.1.5
Message-ID: <1443806654-23945-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/minidlna/minidlna.hash | 5 +++--
 package/minidlna/minidlna.mk   | 2 +-
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
-- 
2.4.9
