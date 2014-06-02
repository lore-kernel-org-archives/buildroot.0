From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 12:46:58 +0200
Subject: [Buildroot] [git commit] package/snappy: bump version
Message-ID: <20140602111141.9101B9CE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9f28b7c8caa4091836866f3323cb7905257539c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the un-tagged 1.1.2 release.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snappy/snappy.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index c30cb3c..6d20df8 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.1.1
-SNAPPY_SITE = http://snappy.googlecode.com/files/
+SNAPPY_VERSION = 1ff9be9b8fafc8528ca9e055646f5932aa5db9c4
+SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3c
 SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_INSTALL_STAGING = YES
