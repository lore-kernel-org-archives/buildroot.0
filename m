From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:57 -0300
Subject: [Buildroot] [PATCH 51/54] startup-notification: add license
	information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-51-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/startup-notification/startup-notification.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index 140b681..902805a 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -12,5 +12,7 @@ STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
 STARTUP_NOTIFICATION_CONF_OPT = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
 	--x-libraries="$(STAGING_DIR)/usr/lib"
+STARTUP_NOTIFICATION_LICENSE = LGPLv2
+STARTUP_NOTIFICATION_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
