From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 08:56:00 +0200
Subject: [Buildroot] [git commit] ti-utils: add license information
Message-ID: <20140627070642.806309D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8dfb05dc8c4244b1cdfca714971be374bc9cf2d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-utils/ti-utils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 1d1c1e6..c0a3663 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -7,6 +7,8 @@
 TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
 TI_UTILS_SITE = $(call github,gxk,ti-utils,$(TI_UTILS_VERSION))
 TI_UTILS_DEPENDENCIES = libnl
+TI_UTILS_LICENSE = BSD-3c
+TI_UTILS_LICENSE_FILES = COPYING
 
 define TI_UTILS_BUILD_CMDS
 	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
