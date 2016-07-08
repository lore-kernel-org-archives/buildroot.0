From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Jul 2016 09:25:12 +0200
Subject: [Buildroot] [PATCH 1/1] libupnp: bump to version 1.6.20
Message-ID: <1467962712-306-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 59f7d7b..64a8bdb 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  b3142b39601243b50532eec90f4a27dba85eb86f58d4b849ac94edeb29d9b22a  libupnp-1.6.19.tar.bz2
+sha256  ee3537081e3ea56f66ada10387486823989210bc98002f098305551c966e3a63  libupnp-1.6.20.tar.bz2
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 48233b6..e12f410 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.6.19
+LIBUPNP_VERSION = 1.6.20
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://downloads.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
-- 
2.7.4
