From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2015 22:58:10 +0200
Subject: [Buildroot] [git commit] linphone: install to staging
Message-ID: <20150402211054.2CB4781908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b3c2b4b088efe6a3dc51d555a92d27e905b4681
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure the liblinphone library gets installed too.

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linphone/linphone.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index daf56be..e0d4fa3 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -13,6 +13,7 @@ LINPHONE_CONF_OPTS = \
 	--disable-strict
 # configure is out of sync causing deplibs linking issues
 LINPHONE_AUTORECONF = YES
+LINPHONE_INSTALL_STAGING = YES
 LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
 LINPHONE_LICENSE = GPLv2+
 LINPHONE_LICENSE_FILES = COPYING
