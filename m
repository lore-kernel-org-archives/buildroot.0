From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 14:23:09 +0100
Subject: [Buildroot] [git commit] mjpegtools: needs host-pkgconf
Message-ID: <20150203132331.B26A17FE41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4aacf11e224e9b23f65d7d2e032abf327a08be94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script uses PKG_CHECK_MODULES to search for libraries.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mjpegtools/mjpegtools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
index b940e7e..b5958c0 100644
--- a/package/mjpegtools/mjpegtools.mk
+++ b/package/mjpegtools/mjpegtools.mk
@@ -6,7 +6,7 @@
 
 MJPEGTOOLS_VERSION = 2.1.0
 MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
-MJPEGTOOLS_DEPENDENCIES = jpeg
+MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
 MJPEGTOOLS_LICENSE = GPLv2+
 MJPEGTOOLS_LICENSE_FILES = COPYING
 
