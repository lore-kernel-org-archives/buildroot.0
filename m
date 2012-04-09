From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Apr 2012 12:19:56 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.16.8
Message-ID: <1333984796-30343-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/mpd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index e3b5331..095bad6 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-MPD_VERSION = 0.16.7
-MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
+MPD_VERSION = 0.16.8
+MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
 MPD_DEPENDENCIES = host-pkg-config libglib2
 
 # Some options need an explicit --disable or --enable
-- 
1.7.3.4
