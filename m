From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Mar 2012 13:33:31 +0100
Subject: [Buildroot] [git commit] e2fsprogs: bump to version 1.42.1
Message-ID: <20120319123700.0E72D953E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4f650feb23ae45a6d1e881f032307e01120ca7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index f3d44f6..fee6f0a 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-E2FSPROGS_VERSION = 1.42
+E2FSPROGS_VERSION = 1.42.1
 E2FSPROGS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 
 E2FSPROGS_CONF_OPT = \
