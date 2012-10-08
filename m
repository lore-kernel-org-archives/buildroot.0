From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Oct 2012 19:01:02 -0300
Subject: [Buildroot] [PATCH 1/4] mpd: bump to version 0.17.2
Message-ID: <1349733665-2584-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/mpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 8a5ceb6..ab3a357 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPD_VERSION = 0.17.1
+MPD_VERSION = 0.17.2
 MPD_SITE = http://downloads.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
 MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
-- 
1.7.8.6
