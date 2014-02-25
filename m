From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2014 20:53:47 +0100
Subject: [Buildroot] [git commit] libpng: fix download location
Message-ID: <20140225200719.9E0179B97B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e505749659cde372fe5c52d2d8e5f9a2e945223
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f8b4d98..b489dd9 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -7,7 +7,7 @@
 LIBPNG_VERSION = 1.6.8
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
-LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
+LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/older-releases/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
