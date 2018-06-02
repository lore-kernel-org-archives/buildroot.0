From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  2 Jun 2018 21:16:59 +0300
Subject: [Buildroot] [PATCH 1/1] monit: bump to version 5.25.2
Message-ID: <20180602181659.17927-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the version and add hash for COPYING

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/monit/monit.hash | 6 ++++--
 package/monit/monit.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 611d3e18a6..d1c09f137c 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,2 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.24.0.tar.gz.sha256:
-sha256  754d1f0e165e5a26d4639a6a83f44ccf839e381f2622e0946d5302fa1f2d2414  monit-5.24.0.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.25.2.tar.gz.sha256:
+sha256  aa0ce6361d1155e43e30a86dcff00b2003d434f221c360981ced830275abc64a  monit-5.25.2.tar.gz
+# Locally computed
+sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 260bb5b7a5..906ed842d6 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.24.0
+MONIT_VERSION = 5.25.2
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
2.17.0
