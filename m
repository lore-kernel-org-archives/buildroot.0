From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:23:58 +0200
Subject: [Buildroot] [git commit] mpd: Fix config option for plugin FAAD2
Message-ID: <20140817192609.D9D8F9D461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67dcfd23a97e24f0716b62a2e1d809488ace8e47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e2ee760..cd18754 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -48,7 +48,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
 MPD_DEPENDENCIES += faad2
 else
-MPD_CONF_OPT += --disable-faad2
+MPD_CONF_OPT += --disable-aac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
