From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Jul 2016 20:16:45 -0300
Subject: [Buildroot] [PATCH] collectd: security bump to version 5.5.2
Message-ID: <1469661405-13444-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a heap overflow in the network plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/collectd.hash | 2 +-
 package/collectd/collectd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 3d982fe..d385c0d 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,2 +1,2 @@
 # From https://collectd.org/files/SHA256SUM
-sha256	f9c5d526e1f0429a7db1ccd90bdf9e23923a2fd43b7285cfda8f0341e5c0bc3f	collectd-5.5.1.tar.bz2
+sha256	017f3a4062187e594d8ab6af685655fb82a8a942dc574668e68242bdb8ba820f	collectd-5.5.2.tar.bz2
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 78e24b8..b9422f3 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.5.1
+COLLECTD_VERSION = 5.5.2
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
-- 
2.7.3
