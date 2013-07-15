From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jul 2013 23:01:42 +0200
Subject: [Buildroot] [git commit] ed: bump to version 1.9
Message-ID: <20130715211528.B429E9A34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=659a1f727922dea4691b4353df77458bc427970e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ed/ed.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 306e918..17de543 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.7
+ED_VERSION = 1.9
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
