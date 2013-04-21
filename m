From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:19:34 +0200
Subject: [Buildroot] [git commit] libwebsockets: bump to version
	1.22-chrome26-firefox18
Message-ID: <20130421212043.BD6BD9B782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8da02c3bf676cc4e193f93cbe4939ffeb3e413e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libwebsockets/libwebsockets.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index a3d8936..e1f1efa 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v1.1-chrome26-firefox18
+LIBWEBSOCKETS_VERSION = v1.22-chrome26-firefox18
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1
 LIBWEBSOCKETS_LICENSE_FILES = COPYING
