From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:10:24 +0200
Subject: [Buildroot] [git commit] knock: bump to version 0.7
Message-ID: <20140618123420.3888C9D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=116f050273d3b4dac3c3831c5a8ace097a2b04c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump knock to version 0.7 and switch away from a git snapshot, it's
nicer and avoids the need to autoreconf.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/knock/knock.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index e4a3d3c..8d2b41e 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-KNOCK_VERSION = 7ce33cd553800f48f16b3bb70b9cd0f1310d2c18
-KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
+KNOCK_VERSION = 0.7
+KNOCK_SITE = http://www.zeroflux.org/proj/knock/files
 KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
-KNOCK_AUTORECONF = YES
 KNOCK_DEPENDENCIES = libpcap
 
 $(eval $(autotools-package))
