From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Jun 2016 20:21:14 +0200
Subject: [Buildroot] [git commit] package/giflib: bump version to 5.1.4
Message-ID: <20160601182327.4510981DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1411eca3fee58addee977cbd5580eb881461a08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/giflib/giflib.hash | 4 ++--
 package/giflib/giflib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index 94bcb5d..cdd7bbd 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/giflib/files
-md5	323a9f11ab56c8a2d1715376410ce376	giflib-5.1.2.tar.bz2
-sha1	3f7bc86280db30a7120b2113f9f261301c515ad2	giflib-5.1.2.tar.bz2
+md5	2c171ced93c0e83bb09e6ccad8e3ba2b	giflib-5.1.4.tar.bz2
+sha1	5f1157cfc377916280849e247b8e34fa0446513f	giflib-5.1.4.tar.bz2
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 6f67a99..799ae73 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIFLIB_VERSION = 5.1.2
+GIFLIB_VERSION = 5.1.4
 GIFLIB_SOURCE = giflib-$(GIFLIB_VERSION).tar.bz2
 GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
 GIFLIB_INSTALL_STAGING = YES
