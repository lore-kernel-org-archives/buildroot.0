From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 16:37:39 -0300
Subject: [Buildroot] [PATCH 10/10] mpg123: bump to version 1.14.1
In-Reply-To: <1336765059-20673-1-git-send-email-gustavo@zacarias.com.ar>
References: <1336765059-20673-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1336765059-20673-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpg123/mpg123.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 65523f3..4635740 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.13.8
+MPG123_VERSION = 1.14.1
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
-MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
+MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 
-- 
1.7.3.4
