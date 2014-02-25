From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 21:09:26 +0100
Subject: [Buildroot] [git commit] libpng: bump to version 1.6.9
Message-ID: <20140228133416.C35939BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c16bc1b12ff334eec117f6c1835d7005eceaa5f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This also fixes the download URL as oudated versions have been
moved to the "older-releases" sub-folder.

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f8b4d98..0bfe7d1 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.8
+LIBPNG_VERSION = 1.6.9
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
