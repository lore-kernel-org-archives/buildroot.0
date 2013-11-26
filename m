From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Nov 2013 08:58:07 -0300
Subject: [Buildroot] [PATCH 1/2] ulogd: bump to version 2.0.3
Message-ID: <1385467088-18933-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ulogd/ulogd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 11780ac..24a5838 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ULOGD_VERSION = 2.0.2
+ULOGD_VERSION = 2.0.3
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 ULOGD_CONF_OPT = --with-dbi=no --with-pgsql=no
-- 
1.8.3.2
