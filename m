From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:25:03 +0200
Subject: [Buildroot] [git commit] mpd: Fix config option for plugin FLAC
Message-ID: <20140817192609.E15DD9CE21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=263b7d23f632a4cccdbbe176ffcf5d319af9bcf7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index cd18754..cddcfb2 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -54,7 +54,7 @@ endif
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
 MPD_DEPENDENCIES += flac
 else
-MPD_CONF_OPT += --without-flac --disable-oggflac
+MPD_CONF_OPT += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_CURL),y)
