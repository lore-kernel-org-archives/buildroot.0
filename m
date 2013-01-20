From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 21:26:39 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: bump to version 1.0.2
Message-ID: <20130120203919.934049A4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a686cff2019611f84cc58e9a0fc5d11381a113b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-babeltrace/lttng-babeltrace.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 60b8a93..82376a3 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -1,5 +1,5 @@
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
-LTTNG_BABELTRACE_VERSION = 1.0.0
+LTTNG_BABELTRACE_VERSION = 1.0.2
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
