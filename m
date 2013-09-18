From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 16:55:53 +0200
Subject: [Buildroot] [git commit] mplayer: security bump to version 1.1.1
Message-ID: <20130918222318.A36349B7D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abd5db62fdec410eaf857b6eb107602734c87999
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mplayer/mplayer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index a13efed..9a511b4 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPLAYER_VERSION = 1.1
+MPLAYER_VERSION = 1.1.1
 MPLAYER_SOURCE = MPlayer-$(MPLAYER_VERSION).tar.xz
 MPLAYER_SITE = http://www.mplayerhq.hu/MPlayer/releases
 
