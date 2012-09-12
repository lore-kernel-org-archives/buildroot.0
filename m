From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Sep 2012 23:27:39 +0200
Subject: [Buildroot] [git commit] patch: bump to version 2.7
Message-ID: <20120912213354.D501999603@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47ac46f5bd6ed2175b63bd92531a45ddc08dfc44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/patch/patch.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index b4206c5..346aabd 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,7 +4,9 @@
 #
 #############################################################
 
-PATCH_VERSION = 2.6
+PATCH_VERSION = 2.7
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
+PATCH_LICENSE = GPLv3+
+PATCH_LICENSE_FILE = COPYING
 
 $(eval $(autotools-package))
