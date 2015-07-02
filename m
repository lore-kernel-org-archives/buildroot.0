From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  2 Jul 2015 23:26:31 +0200
Subject: [Buildroot] [PATCH v1] libv4l: bump version to 1.6.3
Message-ID: <1435872392-21648-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libv4l/libv4l.hash | 2 +-
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 609cfbc..3371d34 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d3d6eb1f0204fb11f3d318bfca35d5f73cc077f88fac7665a47856a16496be7d  v4l-utils-1.6.2.tar.bz2
+sha256 164abf5c1befcd27e8e6ef824a82d4015bdfb5d99ae82daa00e77d895ff9864c  v4l-utils-1.6.3.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 94c7031..b1c783d 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.6.2
+LIBV4L_VERSION = 1.6.3
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
-- 
2.1.4
