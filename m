From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 08:49:46 +0200
Subject: [Buildroot] [git commit] startup-notification: add license
	information
Message-ID: <20140627070642.6E47D9D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7726e8c88194701d07c2aead560c5486e4bdfa85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../startup-notification/startup-notification.mk   |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
