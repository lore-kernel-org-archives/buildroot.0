From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 22:07:49 +0100
Subject: [Buildroot] [git commit] collectd: bump to version 5.1.1
Message-ID: <20121117210903.A5CDF9A07E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7451db3d3aed29c65b7c9acfc880536b381ce1dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/collectd.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6164df2..f6aeb0d 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,10 +4,12 @@
 #
 #############################################################
 
-COLLECTD_VERSION = 5.1.0
+COLLECTD_VERSION = 5.1.1
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
+COLLECTD_LICENSE = GPLv2 LGPLv2.1
+COLLECTD_LICENSE_FILES = COPYING
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = amqp apple_sensors ascent dbi email \
