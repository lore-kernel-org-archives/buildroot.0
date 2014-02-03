From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon,  3 Feb 2014 23:34:34 +0100
Subject: [Buildroot] [PATCH 1/1] libupnp : bump version to 1.6.19
Message-ID: <1391466874-22892-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libupnp/libupnp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index b98b9f4..48233b6 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.6.18
+LIBUPNP_VERSION = 1.6.19
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
-- 
1.8.5.3
