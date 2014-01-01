From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 1 Jan 2014 20:35:10 +0100
Subject: [Buildroot] [PATCH 1/1] mpd: Fix broken download URL
Message-ID: <BLU0-SMTP1005BFDF4C4664AA662BD57D9C80@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mpd/mpd.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index d8f344f..c9fc714 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -6,7 +6,7 @@
 
 MPD_VERSION = 0.17.6
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
-MPD_SITE = http://www.musicpd.org/download/mpd/stable
+MPD_SITE = http://www.musicpd.org/download/mpd/0.17
 MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
 MPD_LICENSE_FILES = COPYING
-- 
1.7.9.5
