From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Jan 2012 11:08:31 +0100
Subject: [Buildroot] [git commit] ed: bump to version 1.6
Message-ID: <20120106101009.49B2A90018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b52a0b2a8b959ff252765fa03e43b05012f24a3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ed/ed.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 2196af0..f5a4b22 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ED_VERSION = 1.5
+ED_VERSION = 1.6
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
