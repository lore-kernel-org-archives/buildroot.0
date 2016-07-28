From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 21:51:19 +0200
Subject: [Buildroot] [git commit] collectd: security bump to version 5.5.2
Message-ID: <20160728201546.5D652819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d5190617bc02e162cd8d819f26a7e6f4ff1fc6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a heap overflow in the network plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
