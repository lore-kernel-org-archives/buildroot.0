From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 17:02:41 -0300
Subject: [Buildroot] [PATCH 7/7] mpd: bump to version 0.17.1
In-Reply-To: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344888161-10068-7-git-send-email-gustavo@zacarias.com.ar>
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
index 54a5ba7..bf4610e 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MPD_VERSION = 0.17
+MPD_VERSION = 0.17.1
 MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
 MPD_DEPENDENCIES = host-pkg-config libglib2
 MPD_LICENSE = GPLv2
-- 
1.7.8.6
