From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Oct 2020 23:16:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libqrencode: bump to version 4.1.1
Message-ID: <20201020211638.956844-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://fukuchi.org/works/qrencode/#news

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libqrencode/libqrencode.hash | 6 +++---
 package/libqrencode/libqrencode.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libqrencode/libqrencode.hash b/package/libqrencode/libqrencode.hash
index d8584c8ac7..ffcc537379 100644
--- a/package/libqrencode/libqrencode.hash
+++ b/package/libqrencode/libqrencode.hash
@@ -1,5 +1,5 @@
-# From http://fukuchi.org/works/qrencode/qrencode-4.0.2.tar.gz.sha
-sha512	c3e3834574ec059a4b571427b29d6f5f26bd806fd7498b9bba778f4eceab6ebe5733eef0f3c4f6af91eb3f2e9310f93f6d7b337c28e85c72db7e59bd79be77a9	qrencode-4.0.2.tar.gz
+# From http://fukuchi.org/works/qrencode/qrencode-4.1.1.tar.gz.sha
+sha512  209bb656ae3f391b03c7b3ceb03e34f7320b0105babf48b619e7a299528b8828449e0e7696f0b5db0d99170a81709d0518e34835229a748701e7df784e58a9ce  qrencode-4.1.1.tar.gz
 
 # Hash for license file:
-sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index 669c4193bd..0062a96a39 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQRENCODE_VERSION = 4.0.2
+LIBQRENCODE_VERSION = 4.1.1
 LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
 LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
 LIBQRENCODE_DEPENDENCIES = host-pkgconf
-- 
2.28.0
