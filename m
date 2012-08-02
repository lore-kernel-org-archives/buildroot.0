From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:30 -0000
Subject: [Buildroot] [git commit branch/next] e2fsprogs: bump to 1.42.4
Message-ID: <20120802195240.1DED7800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5addce8187065c8293d4c8d3e673361e0d3c78e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index db66635..4c0474e 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-E2FSPROGS_VERSION = 1.42.3
+E2FSPROGS_VERSION = 1.42.4
 E2FSPROGS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 
 E2FSPROGS_CONF_OPT = \
