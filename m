From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Jan 2013 13:01:11 -0300
Subject: [Buildroot] [PATCH] collectd: bump to version 5.1.2
Message-ID: <1359388871-30583-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.12.4
