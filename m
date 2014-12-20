From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 15:53:09 +0100
Subject: [Buildroot] [git commit] package/vlc: Update SITE url
Message-ID: <20141220145333.6810D8055C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f9de740fe74cae21831bfc472259794f4c0c735
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

old SITE is now password-protected

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 901f06d..9d99de6 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 VLC_VERSION = 2.1.5
-VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
+VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
