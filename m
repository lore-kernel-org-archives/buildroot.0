From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 22:19:50 +0100
Subject: [Buildroot] [git commit] lttng-babeltrace: bump to 1.0.0
Message-ID: <20130101212114.486379A59B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d70a9f6d645130fd1354ed040a132ac8ed71f46b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-babeltrace/lttng-babeltrace.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index dd701df..60b8a93 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -1,5 +1,5 @@
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
-LTTNG_BABELTRACE_VERSION = 1.0.0-rc6
+LTTNG_BABELTRACE_VERSION = 1.0.0
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
