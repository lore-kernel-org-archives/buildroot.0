From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Jan 2021 18:18:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnp: add LIBUPNP_CPE_ID_VENDOR
Message-ID: <20210105171854.4114-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp/libupnp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 8831885ba4..cb7b9668f7 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -11,5 +11,6 @@ LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
 LIBUPNP_LICENSE_FILES = LICENSE
+LIBUPNP_CPE_ID_VENDOR = libupnp_project
 
 $(eval $(autotools-package))
-- 
2.29.2
