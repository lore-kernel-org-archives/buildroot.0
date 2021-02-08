From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Feb 2021 21:05:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/c-icap: set C_ICAP_CPE_ID_VALID
In-Reply-To: <20210208200519.325110-1-fontaine.fabrice@gmail.com>
References: <20210208200519.325110-1-fontaine.fabrice@gmail.com>
Message-ID: <20210208200519.325110-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:c-icap_project:c-icap is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ac-icap_project%3Ac-icap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-icap/c-icap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 79e317fb29..5548fb4b97 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -9,6 +9,7 @@ C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
 C_ICAP_LICENSE_FILES = COPYING
+C_ICAP_CPE_ID_VALID = YES
 C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
-- 
2.29.2
