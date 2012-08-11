From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Aug 2012 19:27:29 -0300
Subject: [Buildroot] [PATCH 4/8] mpd: bump to version 0.17
In-Reply-To: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344724053-10165-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344724053-10165-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/mpd/mpd.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 28bc4cb..54a5ba7 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-MPD_VERSION = 0.16.8
+MPD_VERSION = 0.17
 MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
 MPD_DEPENDENCIES = host-pkg-config libglib2
+MPD_LICENSE = GPLv2
+MPD_LICENSE_FILES = COPYING
 
 # Some options need an explicit --disable or --enable
 
-- 
1.7.8.6
