From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:00:17 +0200
Subject: [Buildroot] [git commit] lshw: add license information
Message-ID: <20140701224922.298349D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0393ba891ce48c67c211c9c0e24b9d84095a2447
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lshw/lshw.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index cc00347..ee15350 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -6,6 +6,8 @@
 
 LSHW_VERSION = B.02.16
 LSHW_SITE = http://ezix.org/software/files
+LSHW_LICENSE = GPLv2
+LSHW_LICENSE_FILES = COPYING
 
 LSHW_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_ENABLE_LOCALE),)
