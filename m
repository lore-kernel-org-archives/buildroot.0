From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Apr 2013 07:56:04 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.17.4
Message-ID: <1365764164-31122-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/mpd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 5fbc8f6..e098c3d 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-MPD_VERSION = 0.17.3
-MPD_SITE = http://downloads.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
+MPD_VERSION = 0.17.4
+MPD_SITE = http://www.musicpd.org/download/mpd/stable
 MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
 MPD_LICENSE_FILES = COPYING
-- 
1.8.1.5
