From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Oct 2019 12:16:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/expat: bump version to 2.2.9
Message-ID: <20191020101600.12255-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 07faca5e61..588e881d0d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.8/
-md5	cdf54239f892fc7914957f10de1e1c70		expat-2.2.8.tar.xz
-sha1	500a848d7085df06020a86bf64c5f71c0052a080	expat-2.2.8.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.2.9/
+md5	d2384fa607223447e713e1b9bd272376		expat-2.2.9.tar.xz
+sha1	90a361e4c97f8c469479ffadc0de0b121a911fb5	expat-2.2.9.tar.xz
 
 # Locally calculated
-sha256	61caa81a49d858afb2031c7b1a25c97174e7f2009aa1ec4e1ffad2316b91779b	expat-2.2.8.tar.xz
+sha256	1ea6965b15c2106b6bbe883397271c80dfa0331cdf821b2c319591b55eadc0a4	expat-2.2.9.tar.xz
 sha256	46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76	COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 20d0add831..38e5dee75d 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.8
+EXPAT_VERSION = 2.2.9
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.20.1
