From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Jul 2013 21:52:49 +0200
Subject: [Buildroot] [git commit] sconeserver: upstream has moved to GitHub
Message-ID: <20130708195827.B6C1E9A299@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f594e946327cc742ac5517815e9b52bbcd3048fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sconeserver/sconeserver.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 62cc0ee..be5fab7 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -5,10 +5,9 @@
 ################################################################################
 
 # Release 0.6.0 doesn't build cleanly, so use a recent
-# Subversion trunk snapshot.
-SCONESERVER_VERSION = 212
-SCONESERVER_SITE = svn://svn.code.sf.net/p/sconeserver/code/trunk
-SCONESERVER_SITE_METHOD = svn
+# Git commit.
+SCONESERVER_VERSION = d58f2de88c681939554089f786e360042a30c8f8
+SCONESERVER_SITE = git://github.com/sconemad/sconeserver.git
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
 
