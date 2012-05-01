From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 May 2012 10:30:19 -0300
Subject: [Buildroot] [PATCH 1/2] libdvdread: change SITE
Message-ID: <1335879020-4880-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libdvdread/libdvdread.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 5226414..3a9d5be 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -6,7 +6,7 @@
 
 LIBDVDREAD_VERSION = 4.1.3
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
-LIBDVDREAD_SITE = http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
+LIBDVDREAD_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
-- 
1.7.3.4
