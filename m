From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:34 +0100
Subject: [Buildroot] [git commit] squashfs3: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.8384F8FF38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c05f907d059224aa2f5127fae88b6d394da09203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squashfs3/squashfs3.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 178543b..81cdf79 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -3,7 +3,6 @@ SQUASHFS3_SOURCE=squashfs$(SQUASHFS3_VERSION).tar.gz
 SQUASHFS3_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
 
 SQUASHFS3_DEPENDENCIES = zlib
-HOST_SQUASHFS3_DEPENDENCIES = host-zlib
 
 define SQUASHFS3_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE)    \
