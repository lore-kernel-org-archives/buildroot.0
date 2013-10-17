From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Oct 2013 20:05:53 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.17.6
Message-ID: <1382051153-5074-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpd/mpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 737be41..d8f344f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPD_VERSION = 0.17.5
+MPD_VERSION = 0.17.6
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/stable
 MPD_DEPENDENCIES = host-pkgconf libglib2
-- 
1.8.1.5
