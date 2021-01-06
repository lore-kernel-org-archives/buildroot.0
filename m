From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Jan 2021 08:03:38 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_fonttosfnt: bump
 version to 1.2.1
Message-ID: <20210106064925.94CA681232@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7263c0ecc6326de1bf9389ebefa3b2ee94c70ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2020-December/003068.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash | 4 ++--
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
index abd3d16f73..7faa797fde 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -1,5 +1,5 @@
 # From https://lists.x.org/archives/xorg-announce/2020-October/003062.html
-sha256  79f35ace377c5409c05ed71f0e8b75f8ca6ddf0a2f6b6d7ecb770ee10072a621  fonttosfnt-1.2.0.tar.bz2
-sha512  a360bd8535beaef89afa6c0678a40f7c554e9d631e0fcb80bb1363ab72288e27a5e106521610f61c95b8101f79c7f02492a2068411b5f5b695de780d8a1c1b25  fonttosfnt-1.2.0.tar.bz2
+sha256  07c835f1f98d7b462be8f1493d072b62418282421be18197e50579c70b0c259b  fonttosfnt-1.2.1.tar.bz2
+sha512  3d4ece61e31d4a5ed56923ecc1883e80a9308d2062d37345cb5be081bc2b004aadebf99a989601749a63e03eb641e0522d07773a57bca0b4710ed453e4f20742  fonttosfnt-1.2.1.tar.bz2
 # Locally computed
 sha256  f83378580cb7909a98b52bf5cd6a29f4894d76318c5c5312dd3f17a3e92beef1  COPYING
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 8e48234e29..bafc524901 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.2.0
+XAPP_FONTTOSFNT_VERSION = 1.2.1
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
