From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Sep 2014 09:51:48 +0200
Subject: [Buildroot] [git commit] lttng-babeltrace: bump to version 1.2.2
Message-ID: <20140925075215.07D789D782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75356aee8df39cbccf0f2dfc1d3c4d002bb6fb83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-babeltrace/lttng-babeltrace.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 032a4c2..838f5f6 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace
-LTTNG_BABELTRACE_VERSION = 1.2.1
+LTTNG_BABELTRACE_VERSION = 1.2.2
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 LTTNG_BABELTRACE_LICENSE = MIT; LGPL2.1 for include/babeltrace/list.h; GPLv2+ for test code
 LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt gpl-2.0.txt LICENSE
