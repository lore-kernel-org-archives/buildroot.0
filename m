From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Mar 2014 15:05:42 -0300
Subject: [Buildroot] [PATCH] lighttpd: security bump to version 1.4.35
Message-ID: <1394647542-6125-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes lighttpd SA-2014-01 (CVE not assigned yet).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lighttpd/lighttpd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 375f934d..e1b9d79 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).34
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).35
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3c
-- 
1.8.3.2
