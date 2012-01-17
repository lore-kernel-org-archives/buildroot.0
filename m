From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:49 +0100
Subject: [Buildroot] [git commit] xfont_font-util: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224425.40DCB90370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b109bd2bdc64425f099c9c7e0aca57d39708edd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xfont_font-util/xfont_font-util.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 680fdc7..c5243ad 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -11,7 +11,5 @@ XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
 XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
-HOST_XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
-
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
