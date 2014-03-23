From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 22:49:59 +0100
Subject: [Buildroot] [git commit] lttng-libust: bump version to 2.4.0
Message-ID: <20140323221921.F301C9BF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b608ea3ef5258cfc0351b440e7e91fa8697208c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adjust the license details

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-libust/lttng-libust.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index b0ebd3f..375a6a3 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.2.0
+LTTNG_LIBUST_VERSION = 2.4.0
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPLv2.1; GPLv2 for lttng-gen-tp and ust-ctl
+LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
