From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:41:33 +0200
Subject: [Buildroot] [git commit branch/next] liblog4c-localtime: handle
	log4c-config script
Message-ID: <20130511204540.1708F9A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4af6818109bf94ea809c0cb7f39f86527bb907d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liblog4c-localtime/liblog4c-localtime.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index 492c6ef..3701cca 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -8,6 +8,7 @@ LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarbal
 LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
 LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
 LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
+LIBLOG4C_LOCALTIME_CONFIG_SCRIPTS = log4c-config
 
 define LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS
 	chmod +x $(@D)/configure
