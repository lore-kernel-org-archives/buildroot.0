From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Sep 2013 08:14:23 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.17.5
Message-ID: <1378206863-31159-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/mpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 4424b7e..95e18f7 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPD_VERSION = 0.17.4
+MPD_VERSION = 0.17.5
 MPD_SITE = http://www.musicpd.org/download/mpd/stable
 MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
-- 
1.8.1.5
