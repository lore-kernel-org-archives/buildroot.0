From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2011 11:15:13 -0300
Subject: [Buildroot] [PATCH 3/3] mpd: bump to version 0.16.6
In-Reply-To: <1323440113-17197-1-git-send-email-gustavo@zacarias.com.ar>
References: <1323440113-17197-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1323440113-17197-3-git-send-email-gustavo@zacarias.com.ar>
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
index b29b9f7..009fabb 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPD_VERSION = 0.16.5
+MPD_VERSION = 0.16.6
 MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
 MPD_AUTORECONF = YES
 MPD_DEPENDENCIES = host-pkg-config libglib2
-- 
1.7.3.4
