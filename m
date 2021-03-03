From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:22:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/sane-backends: set
 SANE_BACKENDS_CPE_ID_VALID
Message-ID: <20210303092235.468191-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:sane-backends_project:sane-backends is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asane-backends_project%3Asane-backends

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sane-backends/sane-backends.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 52e03da518..9c4494f096 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -10,6 +10,7 @@ SANE_BACKENDS_SITE = \
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
+SANE_BACKENDS_CPE_ID_VALID = YES
 SANE_BACKENDS_INSTALL_STAGING = YES
 
 SANE_BACKENDS_CONF_OPTS = \
-- 
2.30.0
