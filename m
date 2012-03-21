From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Mar 2012 09:02:31 -0300
Subject: [Buildroot] [PATCH 1/2] libupnp: move to version 1.6.14
Message-ID: <1332331352-6072-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed by Sagaert Johan in the mailing list and further testing version
1.6.15 has some issues.
So move to version 1.6.14 which is far more stable and compliant.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-no-ipv6.patch => libupnp-1.6.14-no-ipv6.patch} |    0
 package/libupnp/libupnp.mk                         |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename package/libupnp/{libupnp-1.6.15-no-ipv6.patch => libupnp-1.6.14-no-ipv6.patch} (100%)

diff --git a/package/libupnp/libupnp-1.6.15-no-ipv6.patch b/package/libupnp/libupnp-1.6.14-no-ipv6.patch
similarity index 100%
rename from package/libupnp/libupnp-1.6.15-no-ipv6.patch
rename to package/libupnp/libupnp-1.6.14-no-ipv6.patch
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 1fa07ca..5ac68c3 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBUPNP_VERSION = 1.6.15
+LIBUPNP_VERSION = 1.6.14
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/pupnp/pupnp/libUPnP%20$(LIBUPNP_VERSION)
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
-- 
1.7.3.4
