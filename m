From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 16:43:44 -0300
Subject: [Buildroot] [PATCH] pax-utils: bump to version 0.8.1
Message-ID: <1403034224-17627-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pax-utils/pax-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index 6dbb3bb..fc0589f 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAX_UTILS_VERSION = 0.7
+PAX_UTILS_VERSION = 0.8.1
 PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
 PAX_UTILS_LICENSE = GPLv2
-- 
1.8.5.5
