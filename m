From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Jun 2019 21:14:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/monit: bump to version 5.25.3
Message-ID: <20190622191435.31025-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monit/monit.hash | 4 ++--
 package/monit/monit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index d1c09f137c..3f528590d6 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.25.2.tar.gz.sha256:
-sha256  aa0ce6361d1155e43e30a86dcff00b2003d434f221c360981ced830275abc64a  monit-5.25.2.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.25.3.tar.gz.sha256:
+sha256  c10258c8839d20864d30390e7cbf2ff5e0480a67a6fb80c02aa457d6e3390569  monit-5.25.3.tar.gz
 # Locally computed
 sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 906ed842d6..980da13cb6 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.25.2
+MONIT_VERSION = 5.25.3
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
2.20.1
