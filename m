From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Jan 2017 14:02:10 +0100
Subject: [Buildroot] [git commit] collectd: bump to version 5.7.1
Message-ID: <20170124140955.6B13080AD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61df194ad37c44da697f2cdbc452f48bbd5342c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.hash | 2 +-
 package/collectd/collectd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 2accf83..be2f646 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,2 +1,2 @@
 # From https://collectd.org/files/SHA256SUM
-sha256	25a05fbdc6baad571554342bbac6141928bf95a47fc60ee3b32e46d0c89ef2b2	collectd-5.7.0.tar.bz2
+sha256	7edd3643c0842215553b2421d5456f4e9a8a58b07e216b40a7e8e91026d8e501	collectd-5.7.1.tar.bz2
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index fa6ebae..38354ac 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.7.0
+COLLECTD_VERSION = 5.7.1
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
