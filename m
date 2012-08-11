From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:11 -0400
Subject: [Buildroot] [PATCH 01/17] avahi: add license info
Message-ID: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/avahi/avahi.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index d9c0d1d..a26481d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -13,6 +13,8 @@
 AVAHI_VERSION = 0.6.31
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
+AVAHI_LICENSE = LGPLv2.1+
+AVAHI_LICENSE_FILES = LICENSE
 AVAHI_INSTALL_STAGING = YES
 
 AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
-- 
1.7.9.5
