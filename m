From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  4 Jul 2013 17:45:12 +0100
Subject: [Buildroot] [PATCH] sconeserver: upstream has moved to GitHub
Message-ID: <1372956312-6170-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sconeserver/sconeserver.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

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
 
-- 
1.8.1.2
