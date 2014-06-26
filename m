From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:43 -0300
Subject: [Buildroot] [PATCH 15/53] giblib: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/giblib/giblib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 6d1ebb8..c4caf27 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -12,5 +12,7 @@ GIBLIB_AUTORECONF = YES
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 GIBLIB_CONFIG_SCRIPTS = giblib-config
+GIBLIB_LICENSE = MIT
+GIBLIB_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
