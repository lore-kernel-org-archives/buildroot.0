From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:20:54 +0200
Subject: [Buildroot] [git commit] package/libqrencode: bump to version 4.0.2
Message-ID: <20190717052348.5BFA8814A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5f4d8218fc433d8474817bc9f41c0c2271d89ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://fukuchi.org/works/qrencode/#news

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqrencode/libqrencode.hash | 4 ++--
 package/libqrencode/libqrencode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libqrencode/libqrencode.hash b/package/libqrencode/libqrencode.hash
index 1418413135..d8584c8ac7 100644
--- a/package/libqrencode/libqrencode.hash
+++ b/package/libqrencode/libqrencode.hash
@@ -1,5 +1,5 @@
-# From http://fukuchi.org/works/qrencode/qrencode-4.0.0.tar.gz.sha
-sha512	fdbcee3ef90abf780dcbe495cef3e6ac5449a4a0aaa87d1a1a4f71d97fe6d96974d8132f7e227133cddb5ab73600e968821634752fc0d75113ca0959aae9a5d0	qrencode-4.0.0.tar.gz
+# From http://fukuchi.org/works/qrencode/qrencode-4.0.2.tar.gz.sha
+sha512	c3e3834574ec059a4b571427b29d6f5f26bd806fd7498b9bba778f4eceab6ebe5733eef0f3c4f6af91eb3f2e9310f93f6d7b337c28e85c72db7e59bd79be77a9	qrencode-4.0.2.tar.gz
 
 # Hash for license file:
 sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index 62ca2ed11d..669c4193bd 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQRENCODE_VERSION = 4.0.0
+LIBQRENCODE_VERSION = 4.0.2
 LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
 LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
 LIBQRENCODE_DEPENDENCIES = host-pkgconf
