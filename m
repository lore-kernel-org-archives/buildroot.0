From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:08 -0300
Subject: [Buildroot] [PATCH 01/14] collectd: bump to version 5.7.0
Message-ID: <20161222015921.6832-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/collectd.hash | 2 +-
 package/collectd/collectd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index d385c0d..2accf83 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,2 +1,2 @@
 # From https://collectd.org/files/SHA256SUM
-sha256	017f3a4062187e594d8ab6af685655fb82a8a942dc574668e68242bdb8ba820f	collectd-5.5.2.tar.bz2
+sha256	25a05fbdc6baad571554342bbac6141928bf95a47fc60ee3b32e46d0c89ef2b2	collectd-5.7.0.tar.bz2
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 4846ee4..ccb2f11 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.5.2
+COLLECTD_VERSION = 5.7.0
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
-- 
2.10.2
