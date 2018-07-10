From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 10 Jul 2018 23:56:03 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-mouse:
 bump version to 1.9.3
Message-ID: <20180710215810.9C1BC88315@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a0e39330d08ebf67034ad0bd7f53214cbec6573
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash and all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash | 9 +++++++--
 .../x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
index caba427b22..551ff9d844 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2016-November/002740.html
-sha256 f425d5b05c6ab412a27e0a1106bb83f9e2662b307210abbe48270892387f4b2f  xf86-input-mouse-1.9.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-June/002903.html
+md5 a2104693bbcfe1413397f7905eecd3dc  xf86-input-mouse-1.9.3.tar.bz2
+sha1 b3982998808ba43117fc066c4ecc94ce67c5818e  xf86-input-mouse-1.9.3.tar.bz2
+sha256 93ecb350604d05be98b7d4e5db3b8155a44890069a7d8d6b800c0bea79c85cc5  xf86-input-mouse-1.9.3.tar.bz2
+sha512 d99f5b4b1ef1aa4cbf1a92549e412f54f121bc804e4d6643248ad7ea18081b38b958bd289dc8476ebc0f6ef5f7424c2f2a8abcfaa30cae5378829549af6b148f  xf86-input-mouse-1.9.3.tar.bz2
+# Locally computed
+sha256 472ff645ead9bf3ffb48d42c596376ffc595897e0c0993a071a7ada0da1f4f10  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 5bcbeb70fd..97ee452f9c 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.2
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.3
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
