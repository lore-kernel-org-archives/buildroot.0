From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 21:26:34 +0100
Subject: [Buildroot] [git commit] lttng-libust: bump to version 2.1.1
Message-ID: <20130120203919.57E3E9A4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cc55a2ad1b48dae063420a56c4cd9ff90543990
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lttng-libust/lttng-libust.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index e1f51b1..e143118 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.1.0
+LTTNG_LIBUST_VERSION = 2.1.1
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
