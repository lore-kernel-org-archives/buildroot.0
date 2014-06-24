From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:46 -0300
Subject: [Buildroot] [PATCH 40/54] synergy: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-40-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/synergy/synergy.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 89a3d49..cd5a7a5 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -6,12 +6,12 @@
 
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SITE = http://downloads.sourceforge.net/project/synergy2/Sources/$(SYNERGY_VERSION)
-
 SYNERGY_AUTORECONF = YES
 SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
                    --x-libraries=$(STAGING_DIR)/usr/lib
-
 SYNERGY_DEPENDENCIES = xlib_libXtst \
 		$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
+SYNERGY_LICENSE = GPLv2
+SYNERGY_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
