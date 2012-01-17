From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:41 +0100
Subject: [Buildroot] [git commit] xfont_encodings: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.C0EED8FF38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=deae09e965de114e281b954714e26931b09c7a9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xfont_encodings/xfont_encodings.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 8c4aac4..3207b06 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -9,7 +9,6 @@ XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_MAKE_OPT =
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
-HOST_XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
