From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 May 2013 09:17:31 -0300
Subject: [Buildroot] [PATCH 2/3] mpg123: bump to version 1.15.4
In-Reply-To: <1369743452-12867-1-git-send-email-gustavo@zacarias.com.ar>
References: <1369743452-12867-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1369743452-12867-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpg123/mpg123.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index c65920f..8796392 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.15.3
+MPG123_VERSION = 1.15.4
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
-- 
1.8.1.5
