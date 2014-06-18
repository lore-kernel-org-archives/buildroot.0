From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:57:55 +0200
Subject: [Buildroot] [git commit] libpng: bump to version 1.6.12
Message-ID: <20140618123419.B98C29CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=074b3c7c3066fb0f6e6c9e63ecc0bfd68219c20b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index cdc80f1..325cf85 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.10
+LIBPNG_VERSION = 1.6.12
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
