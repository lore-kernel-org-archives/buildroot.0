From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 01:33:14 +0100
Subject: [Buildroot] [git commit] xmlstarlet: bump to version 1.5.0
Message-ID: <20131111003655.ADD609B9A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec2c83234c2044dd03f47b6029d104c9c5ae7cde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xmlstarlet/xmlstarlet.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 4a30feb..16f736e 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMLSTARLET_VERSION = 1.3.0
+XMLSTARLET_VERSION = 1.5.0
 XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
 XMLSTARLET_LICENSE = MIT
 XMLSTARLET_LICENSE_FILES = COPYING
