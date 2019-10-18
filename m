From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 11:30:26 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20191018092554.74E6F8259E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f48423883ecbe258edb0a78eb5a1bac589df0ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index ea24aec1cb..8928a42dd0 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6a7703fbbe553a2d9f87acafc01162d81f78c6e427b8ab9c83242e1677248582  tvheadend-8f1de1621d78c91431238176bf4f6290870a031a.tar.gz
+sha256 313267b2e2752e5a150e225ec735e7cb9e9af8bb7e9bd05391262f0df01d1437  tvheadend-baf746bc1d420e7d628994922df0ddcb665f698f.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 61732a203c..377c224192 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 8f1de1621d78c91431238176bf4f6290870a031a
+TVHEADEND_VERSION = baf746bc1d420e7d628994922df0ddcb665f698f
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
