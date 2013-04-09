From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Apr 2013 09:58:48 -0300
Subject: [Buildroot] [PATCH] collectd: bump to version 5.1.3
Message-ID: <1365512328-32388-1-git-send-email-gustavo@zacarias.com.ar>
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
-- 
1.8.1.5
