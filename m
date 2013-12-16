From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 12:16:21 +0100
Subject: [Buildroot] [git commit] libtpl: bump git snapshot
Message-ID: <20131216113554.9FA349BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=540a4619ad2237de7f57697803f40c0e77c56d25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtpl/libtpl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 0a0fe8b..ff05991 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPL_VERSION = 445b4e9f236a48e274eaace31acf56d700da142a
+LIBTPL_VERSION = 6df007e450cbee7d7a4896d3538128c5370b1c61
 LIBTPL_SITE = $(call github,troydhanson,tpl,$(LIBTPL_VERSION))
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
