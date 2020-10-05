From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Oct 2020 19:16:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.2.10
Message-ID: <20201005171642.2612627-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update hash of COPYING (update in year:
  https://github.com/libexpat/libexpat/commit/8a93b41a8a4cc2610eb21764047989250544436f)
- Update indentation in hash file (two spaces)

https://github.com/libexpat/libexpat/blob/R_2_2_10/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 10 +++++-----
 package/expat/expat.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 588e881d0d..360c154a40 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.9/
-md5	d2384fa607223447e713e1b9bd272376		expat-2.2.9.tar.xz
-sha1	90a361e4c97f8c469479ffadc0de0b121a911fb5	expat-2.2.9.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.2.10/
+md5  e0fe49a6b3480827c9455e4cfc799133  expat-2.2.9.tar.xz
+sha1  a333b95121a718a77ee481dbade5efcd72a32eb8  expat-2.2.9.tar.xz
 
 # Locally calculated
-sha256	1ea6965b15c2106b6bbe883397271c80dfa0331cdf821b2c319591b55eadc0a4	expat-2.2.9.tar.xz
-sha256	46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76	COPYING
+sha256  5dfe538f8b5b63f03e98edac520d7d9a6a4d22e482e5c96d4d06fcc5485c25f2  expat-2.2.10.tar.xz
+sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 38e5dee75d..bb04ab1a90 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.9
+EXPAT_VERSION = 2.2.10
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.28.0
