From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 16 Sep 2020 18:30:47 +0200
Subject: [Buildroot] [PATCH] package/logrotate: bump to version 3.17.0
Message-ID: <20200916163047.222426-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/logrotate/logrotate.hash | 4 ++--
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 24f2cd834..704cbcabd 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 bc6acfd09925045d48b5ff553c24c567cfd5f59d513c4ac34bfb51fa6b79dc8a  logrotate-3.16.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  c25ea219018b024988b791e91e9f6070c34d2056efa6ffed878067866c0ed765  logrotate-3.17.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index aabf73b6b..fe674ee6a 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.16.0
+LOGROTATE_VERSION = 3.17.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
2.25.1
