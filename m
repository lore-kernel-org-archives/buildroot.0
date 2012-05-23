From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 May 2012 10:29:38 -0300
Subject: [Buildroot] [PATCH 6/7] mpg123: bump to version 1.14.2
In-Reply-To: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1337779779-1783-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 4635740..793812f 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.14.1
+MPG123_VERSION = 1.14.2
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
-- 
1.7.3.4
