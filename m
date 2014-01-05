From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:17:30 +0100
Subject: [Buildroot] [git commit] xorg: Bump xproto_videoproto version to
	2.3.2
Message-ID: <20140105230942.893B49C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cd3ef79e2f8ee05a4143ce143f9e3327ed975c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 2861c91..9226c73 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_VIDEOPROTO_VERSION = 2.3.1
+XPROTO_VIDEOPROTO_VERSION = 2.3.2
 XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
 XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_VIDEOPROTO_LICENSE = MIT
