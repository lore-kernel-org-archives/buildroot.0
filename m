From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 23:03:25 +0100
Subject: [Buildroot] [git commit] collectd: also install to staging
Message-ID: <20130217221226.59E0C9AB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f73f6787bd836e72436efd3339e3232c9637d316
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #5906

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/collectd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index a50be9c..6d26622 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -8,6 +8,7 @@ COLLECTD_VERSION = 5.1.2
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
+COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = GPLv2 LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
 
