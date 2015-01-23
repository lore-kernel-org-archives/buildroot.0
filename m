From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Jan 2015 08:08:25 -0300
Subject: [Buildroot] [PATCH] radvd: bump to version 2.10
Message-ID: <1422011305-30212-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd.hash | 4 ++--
 package/radvd/radvd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index af9e8fb..fe777d5 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,2 +1,2 @@
-# From http://www.litech.org/radvd/dist/radvd-2.9.tar.gz.sha256
-sha256	525ead3ba7fc6378f14c5d96a0de01ff62e9a1fea8cb7233b502a81da05bbab8	radvd-2.9.tar.xz
+# From http://www.litech.org/radvd/dist/radvd-2.10.tar.gz.sha256
+sha256	76ceee8304120ae42cc38d03dd720a3db94a57e459f3184254fa523367fb9773	radvd-2.10.tar.xz
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 4daf9d7..184cf7a 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.9
+RADVD_VERSION = 2.10
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
-- 
2.0.5
