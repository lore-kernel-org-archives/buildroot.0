From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Sep 2012 22:37:27 +0200
Subject: [Buildroot] [git commit] e2fsprogs: fix download URL
Message-ID: <20120903203828.466FB99535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a7e03400c1b79cb9178bb93b9c5076ee37f8206
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is /v$VERSION, not just /$VERSION.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e074640..9002d46 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 E2FSPROGS_VERSION = 1.42.5
-E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/$(E2FSPROGS_VERSION)
+E2FSPROGS_SITE = http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v$(E2FSPROGS_VERSION)
 
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
