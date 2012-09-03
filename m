From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:44 -0000
Subject: [Buildroot] [git commit] mpg123: bump to version 1.14.4
Message-ID: <20120903200535.7CEC19953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bf148d6c7ac6c45e954a3b3c941903a5683df56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/mpg123/mpg123.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index c3d2c9c..3576cb7 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,11 +4,13 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.14.2
+MPG123_VERSION = 1.14.4
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
+MPG123_LICENSE = LGPLv2.1
+MPG123_LICENSE_FILES = COPYING
 
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
