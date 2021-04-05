From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 19:12:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: add CPE variables
Message-ID: <20210405171218.4156121-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:aiohttp_project:aiohttp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaiohttp_project%3Aaiohttp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-aiohttp/python-aiohttp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index f1e755c023..e878ac1a55 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -10,5 +10,7 @@ PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/7a/95/eb60aaad7943
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
+PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp_project
+PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp
 
 $(eval $(python-package))
-- 
2.30.2
