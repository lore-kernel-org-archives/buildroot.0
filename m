From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Oct 2012 21:10:59 +0200
Subject: [Buildroot] [git commit] package/lttng-tools: Bump to version 2.0.4.
Message-ID: <20121020191223.8B20F998CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa866e877b98aabd54f25cfff14a31ee01716c3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-tools/lttng-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 7a0a7b4..fe48ac6 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -3,7 +3,7 @@
 # LTTng-Tools: the trace control client
 #
 #############################################################
-LTTNG_TOOLS_VERSION = 2.0.1
+LTTNG_TOOLS_VERSION = 2.0.4
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 
