From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Jul 2013 11:19:14 -0300
Subject: [Buildroot] [PATCH 4/7] collectd: bump to version 5.3.1
In-Reply-To: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
References: <1373897957-5938-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1373897957-5938-4-git-send-email-gustavo@zacarias.com.ar>
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
-- 
1.8.1.5
