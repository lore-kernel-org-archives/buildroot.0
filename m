From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 22:19:01 +0100
Subject: [Buildroot] [git commit] lttng-modules: bump to 2.1.0
Message-ID: <20130101212113.D8BA49A59B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf32809c5e04eb0fffa3edf0b8323c8ea0183b05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-modules/lttng-modules.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index a245b19..54ae864 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -3,7 +3,7 @@
 # LTTng-modules: the kernel modules (requires at least Linux 2.6.38)
 #
 #############################################################
-LTTNG_MODULES_VERSION = 2.0.3
+LTTNG_MODULES_VERSION = 2.1.0
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 
