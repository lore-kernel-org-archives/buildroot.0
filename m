From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jul 2013 11:43:48 +0200
Subject: [Buildroot] [git commit] lttng-babeltrace: define license
Message-ID: <20130701094857.6DA2399A82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0a5318865f567211711a162558298cb7689260a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-babeltrace/lttng-babeltrace.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 96d3a31..044dac0 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -7,6 +7,8 @@
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
 LTTNG_BABELTRACE_VERSION = 1.1.1
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
+LTTNG_BABELTRACE_LICENSE = MIT; LGPLv2 for include/babeltrace/list.h; GPLv3+ for formats/ctf/metadata/ctf-parser.h
+LTTNG_BABELTRACE_LICENSE_FILES = mit-license.txt LICENSE
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
