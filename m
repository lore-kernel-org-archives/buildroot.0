From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:17:19 +0200
Subject: [Buildroot] [git commit] package/expat: bump version to 2.2.9
Message-ID: <20191020133507.B8C6282DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e13f45586530fb2c039449047c957ce9e93456e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
