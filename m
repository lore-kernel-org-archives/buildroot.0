From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 17:20:00 +0200
Subject: [Buildroot] [git commit] bsdiff: add license information
Message-ID: <20140701153344.022899D11A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e96506ad94260707c90100d30e11dbf10ed626a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bsdiff/bsdiff.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index ce6455c..7d2b296 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -7,6 +7,8 @@
 BSDIFF_VERSION = 4.3
 BSDIFF_SITE = http://www.daemonology.net/bsdiff
 BSDIFF_DEPENDENCIES = bzip2
+BSDIFF_LICENSE = BSD-2c
+BSDIFF_LICENSE_FILES = bsdiff.c
 
 define BSDIFF_BUILD_CMDS
 	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
