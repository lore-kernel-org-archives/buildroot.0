From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 29 Aug 2018 19:11:54 +0200
Subject: [Buildroot] [PATCH 1/1] expat: bump to version 2.2.6
Message-ID: <20180829171154.25333-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 945e102342..6c55972f69 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.5/
-md5	789e297f547980fc9ecc036f9a070d49		expat-2.2.5.tar.bz2
-sha1	490659abd7d6c6d4cb4e60c945a15fbf081564f6	expat-2.2.5.tar.bz2
+# From https://sourceforge.net/projects/expat/files/expat/2.2.6/
+md5	ca047ae951b40020ac831c28859161b2		expat-2.2.6.tar.bz2
+sha1	c8947fc3119a797b55485f2f7bdaaeb49cc9df01	expat-2.2.6.tar.bz2
 
 # Locally calculated
-sha256	d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d473353aedf6	expat-2.2.5.tar.bz2
+sha256	17b43c2716d521369f82fc2dc70f359860e90fa440bea65b3b85f0b246ea81f2	expat-2.2.6.tar.bz2
 sha256	46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76	COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 69c457da3d..61f3176312 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.5
+EXPAT_VERSION = 2.2.6
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.bz2
 EXPAT_INSTALL_STAGING = YES
-- 
2.14.1
