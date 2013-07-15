From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jul 2013 22:59:47 +0200
Subject: [Buildroot] [git commit] collectd: bump to version 5.3.1
Message-ID: <20130715211528.991CD9A34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=865891f1c482ff11017ee7c34e17870b57786997
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/collectd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index b63d430..bead4d4 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.3.0
+COLLECTD_VERSION = 5.3.1
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
