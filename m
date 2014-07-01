From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:38:20 +0200
Subject: [Buildroot] [git commit] sysklogd: add license information
Message-ID: <20140701224922.6EDE89D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ca94afa36737a1b3d91d5e49b5b176c5a1a917e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/sysklogd.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 886e471..37293da 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -5,9 +5,11 @@
 ################################################################################
 
 SYSKLOGD_VERSION = 1.5
-SYSKLOGD_SOURCE  = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
-SYSKLOGD_PATCH   = sysklogd_$(SYSKLOGD_VERSION)-6.diff.gz
-SYSKLOGD_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysklogd
+SYSKLOGD_SOURCE = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
+SYSKLOGD_PATCH = sysklogd_$(SYSKLOGD_VERSION)-6.diff.gz
+SYSKLOGD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysklogd
+SYSKLOGD_LICENSE = GPLv2+
+SYSKLOGD_LICENSE_FILES = COPYING
 
 # Override BusyBox implementations if BusyBox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
