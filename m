From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 May 2012 10:30:20 -0300
Subject: [Buildroot] [PATCH 2/2] libdvdnav: change SITE
In-Reply-To: <1335879020-4880-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335879020-4880-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335879020-4880-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libdvdnav/libdvdnav.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 7f68533..f69f238 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -6,7 +6,7 @@
 
 LIBDVDNAV_VERSION = 4.1.3
 LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
-LIBDVDNAV_SITE = http://www.mplayerhq.hu/MPlayer/releases/dvdnav
+LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 
-- 
1.7.3.4
