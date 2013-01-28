From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 21:27:03 +0100
Subject: [Buildroot] [git commit] collectd: bump to version 5.1.2
Message-ID: <20130128205917.814CF9A85E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae20051b93871525295074659d879bdc61ad6340
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/collectd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index f6aeb0d..a50be9c 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-COLLECTD_VERSION = 5.1.1
+COLLECTD_VERSION = 5.1.2
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
