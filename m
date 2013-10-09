From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 21:17:58 +0200
Subject: [Buildroot] [git commit] linphone: add license
Message-ID: <20131009194411.44B359B9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd2e62f7dd81845f4e78afb60fff13404dc15150
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linphone/linphone.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 6fa1487..a4fc95c 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -12,6 +12,8 @@ LINPHONE_CONF_OPT = \
 	--disable-strict
 
 LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
+LINPHONE_LICENSE = GPLv2+
+LINPHONE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
 LINPHONE_CONF_OPT += --enable-gtk_ui
