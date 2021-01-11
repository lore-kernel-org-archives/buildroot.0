From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 21:14:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnp: set LIBUPNP_CPE_ID_VALID
Message-ID: <20210111201441.1414609-1-fontaine.fabrice@gmail.com>
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
index 8831885ba4..b7836590c2 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -11,5 +11,6 @@ LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 LIBUPNP_LICENSE = BSD-3-Clause
 LIBUPNP_LICENSE_FILES = LICENSE
+LIBUPNP_CPE_ID_VALID = YES
 
 $(eval $(autotools-package))
-- 
2.29.2
