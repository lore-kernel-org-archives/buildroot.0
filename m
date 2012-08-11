From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Aug 2012 19:27:28 -0300
Subject: [Buildroot] [PATCH 3/8] mpg123: bump to version 1.14.4
In-Reply-To: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344724053-10165-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
 
-- 
1.7.8.6
