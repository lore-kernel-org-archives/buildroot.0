From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 22:47:22 +0100
Subject: [Buildroot] [git commit] liburcu: bump version to 0.8.3
Message-ID: <20140323221922.086B79BF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9001356778aa2076968eb49cf97ffc6c11a4ad0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also adjust the license details

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburcu/liburcu.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index a586382..44b640d 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.7.7
+LIBURCU_VERSION = 0.8.3
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
-LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE
-LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt LICENSE
+LIBURCU_LICENSE = LGPLv2.1+ for the library; MIT-like license for few source files listed in LICENSE; GPLv2+ for test; GPLv3 for few *.m4 files
+LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
 
 LIBURCU_INSTALL_STAGING = YES
 
