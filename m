From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:33:35 +0100
Subject: [Buildroot] [git commit] jpeg: Allow building of libjpeg for the
	host
Message-ID: <20120126220754.C364B90591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1d52aea4960c93b1ea939642ef1f69a9c93306f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jpeg/jpeg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 555c3e1..a882268 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -16,3 +16,4 @@ endef
 JPEG_POST_INSTALL_TARGET_HOOKS += JPEG_REMOVE_USELESS_TOOLS
 
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
