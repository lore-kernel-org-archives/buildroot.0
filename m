From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 19 May 2021 22:18:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/supervisor: add
 SUPERVISOR_CPE_ID_VENDOR
Message-ID: <20210519201805.50971-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:supervisord:supervisor is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asupervisord%3Asupervisor

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/supervisor/supervisor.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 424f46a7c2..92e8323080 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -8,6 +8,7 @@ SUPERVISOR_VERSION = 4.1.0
 SUPERVISOR_SITE = https://files.pythonhosted.org/packages/de/87/ee1ad8fa533a4b5f2c7623f4a2b585d3c1947af7bed8e65bc7772274320e
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
 SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
+SUPERVISOR_CPE_ID_VENDOR = supervisord
 SUPERVISOR_SETUP_TYPE = setuptools
 
 define SUPERVISOR_INSTALL_CONF_FILES
-- 
2.30.2
