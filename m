From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  1 Mar 2013 15:17:50 +0100
Subject: [Buildroot] [PATCH 2/2] mpg123: bump to 1.15.1
In-Reply-To: <1362147470-23992-1-git-send-email-yegorslists@googlemail.com>
References: <1362147470-23992-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1362147470-23992-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/multimedia/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 415fc24..43a558a 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPG123_VERSION = 1.14.4
+MPG123_VERSION = 1.15.1
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPT = --with-optimization=0 --disable-lfs-alias
-- 
1.7.7
