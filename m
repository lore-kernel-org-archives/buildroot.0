From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:12 -0300
Subject: [Buildroot] [PATCH 15/19] rdesktop: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rdesktop/rdesktop.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index fa7359c..75d0d98 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -9,5 +9,7 @@ RDESKTOP_SOURCE = rdesktop-$(RDESKTOP_VERSION).tar.gz
 RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
 RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
+RDESKTOP_LICENSE = GPLv2+
+RDESKTOP_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.1.5
