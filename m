From: Will Newton <will.newton@gmail.com>
Date: Fri, 19 Oct 2012 17:27:38 +0100
Subject: [Buildroot] [PATCH 2/3] package/lttng-tools: Bump to version 2.0.4.
Message-ID: <CAFbHwiTFyP+kDPCJzfxNBuTofSfAgmksOk91_c81W_jaetM3RA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/lttng-tools/lttng-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.mk
b/package/lttng-tools/lttng-tools.mk
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

-- 
1.7.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-package-lttng-tools-Bump-to-version-2.0.4.patch
Type: application/octet-stream
Size: 888 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121019/00d28431/attachment.obj>
