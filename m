From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Apr 2013 11:53:26 +0200
Subject: [Buildroot] [git commit] collectd: bump to version 5.1.3
Message-ID: <20130410095312.1C7AD9B53E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=742d24c68e7b0f931003152ec2e1a3b203f77206
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/collectd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 88f6737..6022ab3 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-COLLECTD_VERSION = 5.1.2
+COLLECTD_VERSION = 5.1.3
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
