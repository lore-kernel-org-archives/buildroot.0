From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:36 +0100
Subject: [Buildroot] [PATCH 06/16] pthread-stubs: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-6-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/pthread-stubs/pthread-stubs.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
index b62084b..f40332a 100644
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ b/package/x11r7/pthread-stubs/pthread-stubs.mk
@@ -3,10 +3,11 @@
 # pthread-stubs
 #
 #############################################################
-PTHREAD_STUBS_VERSION = 0.1
+PTHREAD_STUBS_VERSION = 0.3
 PTHREAD_STUBS_SOURCE = libpthread-stubs-$(PTHREAD_STUBS_VERSION).tar.bz2
 PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
 
+PTHREAD_STUBS_LIBTOOL_PATCH = NO
 PTHREAD_STUBS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package/x11r7,pthread-stubs))
-- 
1.7.0
