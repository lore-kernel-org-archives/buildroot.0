From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jun 2013 10:03:21 +0200
Subject: [Buildroot] [git commit] mxml: fix site url
Message-ID: <20130626132359.658499B088@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc6d9070b2141afc057ef92253cfbd8199876527
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mxml/mxml.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 778e9bf..020cde2 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MXML_VERSION = 2.7
-MXML_SITE = http://ftp.easysw.com/pub/mxml/$(MXML_VERSION)
+MXML_SITE = http://www.msweet.org/files/project3
 MXML_LICENSE = LGPLv2+ with exceptions
 MXML_LICENSE_FILES = COPYING
 MXML_INSTALL_STAGING = YES
