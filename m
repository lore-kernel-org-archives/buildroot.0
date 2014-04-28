From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Apr 2014 21:46:05 +0200
Subject: [Buildroot] [git commit] ofono: bump to version 1.14
Message-ID: <20140428195235.581F89C961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e4b0e62e16f7d667eba51f9b23e0b1496b90866
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jer??nimo Lopes <lopesjeronimo@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/ofono.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 9e30c63..3f31447 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.13
+OFONO_VERSION = 1.14
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
