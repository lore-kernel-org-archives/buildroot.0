From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Oct 2011 14:48:15 +0200
Subject: [Buildroot] [git commit] libplayer: remove unneeded extra
	AUTOTARGETS parameters
Message-ID: <20111006124854.7D2048E25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77ffba834f81a1fb6a9d499c004eb9a8cd82085a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libplayer/libplayer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libplayer/libplayer.mk b/package/multimedia/libplayer/libplayer.mk
index 1552431..093821e 100644
--- a/package/multimedia/libplayer/libplayer.mk
+++ b/package/multimedia/libplayer/libplayer.mk
@@ -41,4 +41,4 @@ ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)
 	LIBPLAYER_CONF_OPT += --enable-binding-python
 endif
 
-$(eval $(call AUTOTARGETS,package,libplayer))
+$(eval $(call AUTOTARGETS))
